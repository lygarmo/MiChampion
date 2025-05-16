// src/components/RatingStars.tsx
import { useState } from "react";
import { useUser } from "@clerk/clerk-react";
import { supabase } from "../supabaseClient";

type Props = {
  burgerId: string;
  puntuacionInicial: number;
};

export default function RatingStars({ burgerId, puntuacionInicial }: Props) {
  const { user } = useUser();
  const [rating, setRating] = useState(puntuacionInicial);

  async function actualizarPuntuacion(nueva: number) {
    if (!user) return;
    setRating(nueva);
    await supabase
      .from("hamburguesas_probadas")
      .update({ puntuacion: nueva })
      .eq("usuario_id", user.id)
      .eq("hamburguesa_id", burgerId);
  }

  return (
    <div className="flex gap-1 mt-4">
      {[1, 2, 3, 4, 5].map((n) => (
        <button
          key={n}
          className={`text-2xl ${n <= rating ? "text-yellow-400" : "text-gray-300"}`}
          onClick={() => actualizarPuntuacion(n)}
        >
          ★
        </button>
      ))}
    </div>
  );
}
