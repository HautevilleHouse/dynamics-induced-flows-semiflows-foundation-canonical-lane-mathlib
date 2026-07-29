import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

abbrev Time := ℝ
abbrev StateSpace := ℝ → ℝ

structure Semiflow where
  state : StateSpace
  time : Time
  evolution : Time → StateSpace → StateSpace
  semigroup : ∀ t s x, evolution (t + s) x = evolution s (evolution t x)
  identity : ∀ x, evolution 0 x = x

def zeroState : StateSpace := fun _ => 0

def trivialSemiflow : Semiflow := {
  state := zeroState
  time := 0
  evolution := fun _ x => x
  semigroup := by
    intro t s x
    rfl
  identity := by
    intro x
    rfl
}

def SemiflowInvariant (F : Semiflow) (property : StateSpace → Prop) : Prop :=
  ∀ t, property (F.state) → property (F.evolution t (F.state))

def CompleteMetric (X : Type) (d : X → X → ℝ) : Prop :=
  ∀ (f : ℕ → X) (h : ∀ ε > 0, ∃ N, ∀ n m ≥ N, d (f n) (f m) < ε), ∃ (x : X), d (f 0) x = 0

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse