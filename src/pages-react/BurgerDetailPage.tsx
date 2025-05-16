// src/pages-react/BurgerDetailPage.tsx
import AppShell from "../components/AppShell";
import BurgerDetailWrapper from "../components/BurgerDetailWrapper";

type Props = {
  burgerId: string;
};

export default function BurgerDetailPage({ burgerId }: Props) {
  return (
    <AppShell>
      <BurgerDetailWrapper burgerId={burgerId} />
    </AppShell>
  );
}
