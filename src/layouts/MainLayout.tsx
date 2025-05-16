// src/layouts/MainLayout.tsx
import "../styles/global.css";

export default function MainLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <>
      <main className="max-w-3xl mx-auto p-4">{children}</main>
    </>
  );
}
