// src/components/MisBurgersPageWrapper.tsx
import ProtectedMisBurgers from "./ProtectedMisBurgers";

export default function MisBurgersPageWrapper() {
  return (
    <div className="w-full px-4">
      <ProtectedMisBurgers />
    </div>
  );
}
