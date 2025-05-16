// src/pages-react/MisBurgersPage.tsx
import AppShell from "../components/AppShell";
import MisBurgersPageWrapper from "../components/MisBurgersPageWrapper";

export default function MisBurgersPage() {
  return (
    <AppShell>
      <h1 className="text-2xl font-bold mb-4">🍔 Mis hamburguesas probadas</h1>
      <MisBurgersPageWrapper />
    </AppShell>
  );
}
