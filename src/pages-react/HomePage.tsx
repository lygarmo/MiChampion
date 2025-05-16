// src/pages-react/HomePage.tsx
import AppShell from "../components/AppShell";

export default function HomePage() {
  return (
    <AppShell>
      <h1 className="text-4xl font-bold text-center mt-10">
        Bienvenido a <span className="text-purple-600">Champions Burger</span> 🍔
      </h1>
      <p className="text-center text-lg mt-4 text-gray-600">
        Explora, guarda y puntúa tus hamburguesas favoritas.
      </p>
    </AppShell>
  );
}
