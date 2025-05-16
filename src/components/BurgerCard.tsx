// src/components/BurgerCard.tsx

type Props = {
  id: string;
  nombre: string;
  descripcion: string;
  imagen_url: string;
  restaurante: string;
};

export default function BurgerCard({ id, nombre, descripcion, imagen_url, restaurante }: Props) {
  return (
    <div className="border rounded-xl p-4 shadow-md hover:shadow-lg transition bg-white flex flex-col">
      <img
        src={imagen_url}
        alt={nombre}
        className="rounded-lg w-full h-48 object-cover mb-2"
      />
      <h3 className="text-lg font-bold">{nombre}</h3>
      <p className="text-sm text-gray-700 flex-1">{descripcion}</p>
      <p className="text-xs text-gray-500 mt-1">🍴 {restaurante}</p>

      <a
        href={`/burgers/${id}`}
        className="mt-4 inline-block bg-black text-white text-sm py-2 px-4 rounded hover:bg-gray-800 text-center"
      >
        Ver detalles
      </a>
    </div>
  );
}
