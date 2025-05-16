import { SignedIn, SignedOut, RedirectToSignIn, useUser } from "@clerk/clerk-react";

export default function ProtectedMisBurgers() {
  const { user } = useUser();

  return (
    <>
      <SignedOut>
        <RedirectToSignIn redirectUrl="/" />
      </SignedOut>

      <SignedIn>
        <div className="p-8">
          <h1 className="text-3xl font-bold">Tus hamburguesas guardadas 🍔</h1>
          <p>Hola {user?.firstName}</p>
        </div>
      </SignedIn>
    </>
  );
}
