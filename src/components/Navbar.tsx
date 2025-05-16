// src/components/Navbar.tsx
import { SignedIn, SignedOut, SignInButton, UserButton } from '@clerk/clerk-react';

export default function Navbar() {
  return (
    <nav className="w-full border-b border-gray-300 px-6 py-4 mb-6 flex justify-between items-center">
      <h1 className="text-2xl font-bold">🍔 Champions Burger</h1>
      <div>
        <SignedOut>
          <SignInButton />
        </SignedOut>
        <SignedIn>
          <UserButton />
        </SignedIn>
      </div>
    </nav>
  );
}