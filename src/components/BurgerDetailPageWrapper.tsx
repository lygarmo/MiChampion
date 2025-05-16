// src/components/BurgerDetailPageWrapper.tsx
import BurgerDetailWrapper from "./BurgerDetailWrapper";

type Props = {
  burgerId: string;
};

export default function BurgerDetailPageWrapper({ burgerId }: Props) {
  return <BurgerDetailWrapper burgerId={burgerId} />;
}
