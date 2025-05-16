import { useEffect, useState } from "react";
import { supabase } from "../supabaseClient";
import BurgerCard from "./BurgerCard";

type Burger = {
  id: string;
  nombre: string;
  descripcion: string;
  imagen_url: string;
  restaurante: string;
};

export default function BurgersList() {
  const [burgers, setBurgers] = useState<Burger[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchBurgers() {
      const { data, error } = await supabase.from("hamburguesas").select("*");
      if (!error && data) setBurgers(data);
      setLoading(false);
    }

    fetchBurgers();
  }, []);

  if (loading) return <p className="text-center mt-8">Cargando hamburguesas...</p>;

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mt-6">
      {burgers.map((burger) => (
        <BurgerCard key={burger.id} {...burger} />
      ))}
    </div>
  );
}
