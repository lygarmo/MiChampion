import { SignedIn, SignedOut, useUser } from "@clerk/clerk-react";
import { useSignInModal } from "../hooks/useSignInModal";
import { useEffect, useState } from "react";
import { supabase } from "../supabaseClient";
import StarRating from "./StarRating";
import { motion, AnimatePresence } from "framer-motion";


export default function ProtectedMisBurgers() {
  const { user } = useUser();
  const [orden, setOrden] = useState<"mas-alta" | "mas-baja" | "">("");
  const [filtroPuntuacion, setFiltroPuntuacion] = useState<number | null>(null);
  const { open, SignInModal } = useSignInModal("/misburgers");
  const [misBurgers, setMisBurgers] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchText, setSearchText] = useState("");
  const [alergenos, setAlergenos] = useState<any[]>([]);
  const [burgerToDelete, setBurgerToDelete] = useState<string | null>(null);
  const [selectedAlergenos, setSelectedAlergenos] = useState<string[]>([]);
  const [totalBurgers, setTotalBurgers] = useState(0);


  useEffect(() => {
    if (!user) return;

    async function fetchMisBurgers() {
      const { data, error } = await supabase
        .from("hamburguesas_probadas")
        .select("puntuacion, hamburguesas(*, hamburguesa_alergenos(alergenos(nombre, icono_url)))")
        .eq("usuario_id", user.id);

      if (data) {
        setMisBurgers(data);

        // Extraer alérgenos únicos con nombre e icono
        const allAlergenos = data
          .flatMap((item) => item.hamburguesas.hamburguesa_alergenos || [])
          .map((item) => item.alergenos)
          .filter(
            (x, i, arr) => x?.nombre && arr.findIndex(a => a.nombre === x.nombre) === i
          );

        setAlergenos(allAlergenos);
      }

      setLoading(false);
    }

     async function fetchTotalBurgers() {
      const { count } = await supabase
        .from("hamburguesas")
        .select("*", { count: "exact", head: true });
        
      if (count !== null) setTotalBurgers(count);
    }


    async function handleRatingUpdate(burgerId: string, newRating: number) {
      if (!user) return;

      const { error } = await supabase
        .from("hamburguesas_probadas")
        .upsert({
          usuario_id: user.id,
          hamburguesa_id: burgerId,
          puntuacion: newRating,
        });

      if (error) {
        console.error("Error actualizando puntuación:", error);
      } else {
        // Actualiza el estado local de misBurgers
        setMisBurgers((prev) =>
          prev.map((item) =>
            item.hamburguesas.id === burgerId
              ? { ...item, puntuacion: newRating }
              : item
          )
        );
      }
    }


    fetchMisBurgers();
    fetchTotalBurgers();
  }, [user]);

  async function handleUnmark(burgerId: string) {
      if (!user) return;

      const { error } = await supabase
        .from("hamburguesas_probadas")
        .delete()
        .eq("usuario_id", user.id)
        .eq("hamburguesa_id", burgerId);

      if (!error) {
        setMisBurgers((prev) =>
          prev.filter((item) => item.hamburguesas.id !== burgerId)
        );
        setBurgerToDelete(null); // cerrar modal
      } else {
        console.error("Error al desmarcar burger:", error);
      }
    }

  const filteredBurgers = misBurgers
  .filter((item) => {
    const matchesSearch = item.hamburguesas.nombre
      .toLowerCase()
      .includes(searchText.toLowerCase());

    const matchesAlergenos =
      selectedAlergenos.length === 0 ||
      (item.hamburguesas.hamburguesa_alergenos || []).some((al) =>
        selectedAlergenos.includes(al.alergenos.nombre)
      );

    const matchesPuntuacion =
      filtroPuntuacion === null || item.puntuacion === filtroPuntuacion;

    return matchesSearch && matchesAlergenos && matchesPuntuacion;
  })
  .sort((a, b) => {
    if (orden === "mas-alta") return (b.puntuacion ?? 0) - (a.puntuacion ?? 0);
    if (orden === "mas-baja") return (a.puntuacion ?? 0) - (b.puntuacion ?? 0);
    return 0;
  });


  return (
    <>
      <SignedOut>
        <div className="p-8 text-center">
          <h1 className="text-2xl font-bold mb-4">¡Ups! Debes iniciar sesión para ver tus hamburguesas 🍔</h1>

          <button
            onClick={open}
            className="mt-4 bg-purple-600 text-white px-4 py-2 rounded hover:bg-purple-700"
          >
            Iniciar sesión ahora
          </button>
        </div>
      </SignedOut>

      <SignInModal />

      <SignedIn>
        <div className="p-4">
          <h2 className="text-2xl font-bold mt-6">Tus hamburguesas guardadas 🍔</h2>

          {misBurgers.length === 0 ? (
          <div className="text-center mt-8 text-lg text-gray-600">
            🍔 <strong>¡Empieza a disfrutar!</strong><br />
            Aún no has probado ninguna burger. Ve a la carta y marca tus favoritas para llevar el control.
          </div>
        ) : misBurgers.length === totalBurgers ? (
          <div className="text-center mt-8 text-lg text-gray-700">
            🏆 <strong>¡Te las has comido todas!</strong><br />
            ¿Quieres nuevos retos?<br />
            <span className="italic text-purple-600">Muy pronto tendremos una sorpresa para ti...</span>
          </div>
        ) : (
          <div className="text-center mt-4 text-sm text-gray-600">
            Has probado <strong>{misBurgers.length}</strong> de <strong>{totalBurgers}</strong> burgers. ¡Sigue sumando!
          </div>
        )}


          {/* 🔍 Buscador */}
          <div className="relative max-w-md mb-6">
            <input
              type="text"
              placeholder="🔍 Buscar por nombre..."
              className="border border-gray-300 mt-8 rounded-full px-4 py-2 w-full shadow-sm focus:ring-2 focus:ring-purple-500 focus:outline-none"
              value={searchText}
              onChange={(e) => setSearchText(e.target.value)}
            />
          </div>

          <div className="flex flex-wrap gap-4 mb-6 items-center">
          {/* Ordenar por */}
          <div className="flex items-center gap-2">
            <label className="text-sm font-medium">Ordenar por:</label>
            <select
              value={orden}
              onChange={(e) => setOrden(e.target.value as any)}
              className="bg-white border border-purple-300 text-gray-800 text-sm rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-purple-500 block px-4 py-2 transition shadow-sm hover:shadow-md cursor-pointer"
            >
              <option value="">--</option>
              <option value="mas-alta">⭐ Más alta</option>
              <option value="mas-baja">⭐ Más baja</option>
            </select>

          </div>

          {/* Filtrar por puntuación */}
          <div className="flex items-center gap-2">
            <label className="text-sm font-medium">Filtrar puntuación:</label>
            <select
              value={filtroPuntuacion ?? ""}
              onChange={(e) =>
                setFiltroPuntuacion(e.target.value === "" ? null : Number(e.target.value))
              }
              className="bg-white border border-purple-300 text-gray-800 text-sm rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-purple-500 block px-4 py-2 transition shadow-sm hover:shadow-md cursor-pointer"
            >
              <option value="">Todas</option>
              {[5, 4, 3, 2, 1].map((n) => (
                <option key={n} value={n}>
                  {`⭐ ${n}`}
                </option>
              ))}
            </select>

          </div>
        </div>


          {/* 🧩 Filtros por alérgenos */}
          <div className="mb-6 flex flex-wrap gap-3">
            {alergenos.map((alerg) => {
              const isSelected = selectedAlergenos.includes(alerg.nombre);
              return (
                <button
                  key={alerg.nombre}
                  onClick={() =>
                    setSelectedAlergenos((prev) =>
                      isSelected ? prev.filter((a) => a !== alerg.nombre) : [...prev, alerg.nombre]
                    )
                  }
                  className={`flex items-center gap-1 px-2 py-1 rounded-full text-xs shadow-sm transition-transform duration-200 hover:scale-105 hover:brightness-110 ${
                    isSelected
                      ? "bg-purple-600 text-white"
                      : "bg-yellow-100 text-gray-800"
                  }`}
                >
                  {alerg.icono_url && (
                    <img
                      src={alerg.icono_url}
                      alt={alerg.nombre}
                      className="w-3.5 h-3.5 object-contain"
                    />
                  )}
                  {alerg.nombre}
                </button>
              );
            })}
          </div>


          {/* 🍔 Tarjetas de hamburguesas */}
          {loading ? (
            <p>Cargando tus burgers...</p>
          ) : filteredBurgers.length === 0 ? (
            <p>No hay burgers que coincidan con tu búsqueda 😢</p>
          ) : (
            <ul className="flex flex-col space-y-8">
            <AnimatePresence mode="popLayout">
            {filteredBurgers.map((item) => (
              <motion.li
                key={item.hamburguesas.id}
                layout
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                exit={{ opacity: 0, scale: 0.95 }}
                transition={{ duration: 0.25 }}
                className="relative group flex flex-col md:flex-row items-center justify-between bg-white rounded-2xl shadow-md p-6 gap-4 md:gap-8"
              >
                {/* 📸 Imagen */}
                <div className="relative overflow-hidden rounded-lg group w-full md:w-48 flex-shrink-0">
                  <img
                    src={item.hamburguesas.imagen_url}
                    alt={item.hamburguesas.nombre}
                    className="w-full h-32 object-cover transform transition-transform duration-300 group-hover:scale-105"
                  />
                  <div className="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-30 transition duration-300" />

                  {/* Botón Ver detalles con animación desde abajo */}
                  <a
                    href={`/burgers/${item.hamburguesas.id}`}
                    className="whitespace-nowrap absolute bottom-4 left-1/2 transform -translate-x-1/2 translate-y-4 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 bg-black text-white text-sm py-2 px-6 rounded-full transition-all duration-300"
                  >
                    Ver detalles
                  </a>
                </div>

                <div className="absolute top-3 right-3 opacity-0 group-hover:opacity-100 transition-opacity">
                  <motion.button
                    whileHover={{ scale: 1.2 }}
                    whileTap={{ scale: 0.95 }}
                    onClick={() => setBurgerToDelete(item.hamburguesas.id)}
                    className="text-red-500 hover:text-red-700 text-xl transition-colors duration-200"
                    title="Quitar de favoritos"
                  >
                    🗑️
                  </motion.button>
                </div>



                {/* 📝 Nombre y descripción */}
                <div className="flex-1 text-center md:text-left">
                  <h2 className="text-xl font-bold text-purple-800">{item.hamburguesas.nombre}</h2>
                  <p className="text-gray-700 mt-1 line-clamp-3">
                    {item.hamburguesas.descripcion || "No hay descripción disponible..."}
                  </p>
                </div>

                {/* ⭐ Puntuación y alérgenos */}
                <div className="flex flex-col items-center md:items-end gap-2 w-full md:w-64">
                  <AnimatePresence mode="wait">
                    <motion.div
                      key={`rating-${item.hamburguesas.id}`}
                      initial={{ opacity: 0 }}
                      animate={{ opacity: 1 }}
                      exit={{ opacity: 0 }}
                      transition={{ duration: 0.3 }}
                      className="text-center"
                    >
                      <StarRating
                        burgerId={item.hamburguesas.id}
                        usuarioId={user?.id}
                        initialRating={item.puntuacion}
                        onRated={(newRating) => handleRatingUpdate(item.hamburguesas.id, newRating)}
                      />
                      {item.puntuacion === null && (
                        <p className="text-sm text-gray-400 mt-2">
                          ¿Quieres puntuarla? Solo tienes que hacer clic en las estrellas ⭐
                        </p>
                      )}
                    </motion.div>
                  </AnimatePresence>


                  {/* Iconos de alérgenos */}
                  {item.hamburguesas.hamburguesa_alergenos?.length > 0 && (
                    <div className="flex flex-wrap justify-center md:justify-end gap-2 mt-2">
                      {item.hamburguesas.hamburguesa_alergenos.map((al) => (
                        <div
                          key={al.alergenos.nombre}
                          title={al.alergenos.nombre}
                          className="bg-yellow-100 px-2 py-1 rounded-full text-xs flex items-center gap-1 shadow-sm transition-transform duration-200 hover:scale-105 hover:brightness-110"
                        >
                          {al.alergenos.icono_url && (
                            <img
                              src={al.alergenos.icono_url}
                              alt={al.alergenos.nombre}
                              className="w-3.5 h-3.5 object-contain"
                            />
                          )}
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              </motion.li>
            ))}
          </AnimatePresence>
        </ul>
          )}
        </div>
        {burgerToDelete && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div className="bg-white p-6 rounded-xl shadow-lg max-w-sm w-full text-center space-y-4">
              <h2 className="text-lg font-semibold">¿Estás seguro?</h2>
              <p className="text-sm text-gray-600">
                ¿Quieres quitar esta burger de tus favoritos?
              </p>
              <div className="flex justify-center gap-4 pt-4">
                <button
                  onClick={() => setBurgerToDelete(null)}
                  className="px-4 py-2 rounded bg-gray-200 hover:bg-gray-300"
                >
                  Cancelar
                </button>
                <button
                  onClick={() => handleUnmark(burgerToDelete)}
                  className="px-4 py-2 rounded bg-red-600 text-white hover:bg-red-700"
                >
                  Quitar
                </button>
              </div>
            </div>
          </div>
        )}

      </SignedIn>
    </>
  );
}
