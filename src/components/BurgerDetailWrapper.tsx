// src/components/BurgerDetailWrapper.tsx
import { useState, useEffect } from "react";
import { supabase } from "../supabaseClient";
import { useUser } from "@clerk/clerk-react";

type Props = {
  burgerId: string;
};

export default function BurgerDetailWrapper({ burgerId }: Props) {
  const [burger, setBurger] = useState<any>(null);
  const [alergenos, setAlergenos] = useState<any[]>([]);
  const { user } = useUser();


  useEffect(() => {
    async function fetchData() {
      const { data } = await supabase
        .from("hamburguesas")
        .select("*")
        .eq("id", burgerId)
        .single();
      setBurger(data);

      const { data: alergData } = await supabase
        .from("hamburguesa_alergenos")
        .select("alergenos(nombre, icono_url)")
        .eq("hamburguesa_id", burgerId);
      setAlergenos(alergData || []);
    }

    fetchData();
  }, [burgerId]);

  if (!burger) return <p className="p-4">Cargando...</p>;

  return (
    <>
      <main className="max-w-3xl mx-auto p-4">
        <h1 className="text-4xl font-bold mb-4">{burger.nombre}</h1>
        <img
          src={burger.imagen_url}
          alt={burger.nombre}
          className="rounded-xl mb-6"
        />
        <h2 className="text-xl text-gray-700 mb-2">{burger.restaurante}</h2>
        <p className="text-gray-800 mb-4">{burger.descripcion}</p>

        {alergenos.length > 0 && (
          <div className="mb-4">
            <h3 className="font-semibold text-sm text-gray-600 mb-2">
              Contiene:
            </h3>
            <ul className="flex flex-wrap gap-2">
              {alergenos.map((item) => (
                <li
                  key={item.alergenos.nombre}
                  className="bg-yellow-100 px-3 py-1 rounded-full text-sm flex items-center gap-1"
                >
                  {item.alergenos.icono_url && (
                    <img
                      src={item.alergenos.icono_url}
                      className="w-4 h-4"
                    />
                  )}
                  {item.alergenos.nombre}
                </li>
              ))}
            </ul>
          </div>
        )}

        <div className="mt-6">
        {user ? (
          <button className="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg">
            Marcar como probada 🍔
          </button>
        ) : (
          <p className="text-sm text-gray-600 italic">
            <a href="/sign-in" className="text-blue-600 underline">Inicia sesión</a> para marcar esta burger como probada.
          </p>
        )}
      </div>

      </main>
    </>
  );
}
