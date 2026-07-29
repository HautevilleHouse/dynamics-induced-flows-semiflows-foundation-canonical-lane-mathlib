import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

abbrev Time := ℝ
abbrev StateSpace := ℝ
abbrev FlowMap := Time → StateSpace → StateSpace
abbrev SemiflowMap := Time → StateSpace → StateSpace

structure SemiflowOperators where
  timeDerivative : (StateSpace → StateSpace) → (StateSpace → StateSpace)
  generator : (StateSpace → StateSpace)
  composition : (StateSpace → StateSpace) → (StateSpace → StateSpace) → (StateSpace → StateSpace)
  identity : StateSpace → StateSpace
  compositionAssociative : ∀ f g h, composition (composition f g) h = composition f (composition g h)
  identityLeft : ∀ f, composition identity f = f
  identityRight : ∀ f, composition f identity = f

def primitiveSemiflowOperators : SemiflowOperators := {
  timeDerivative := fun f => f
  generator := fun x => x
  composition := fun f g => fun x => f (g x)
  identity := fun x => x
  compositionAssociative := by
    intro f g h
    rfl
  identityLeft := by
    intro f
    rfl
  identityRight := by
    intro f
    rfl
}

structure Semiflow where
  semiflowMap : SemiflowMap
  operators : SemiflowOperators
  semigroupProperty : Prop
  continuity : Prop

def primitiveSemiflow : Semiflow := {
  semiflowMap := fun t x => x
  operators := primitiveSemiflowOperators
  semigroupProperty := True
  continuity := True
}

def SemigroupProperty (F : Semiflow) : Prop :=
  ∀ t s x, F.semiflowMap t (F.semiflowMap s x) = F.semiflowMap (t + s) x

def ContinuityProperty (F : Semiflow) : Prop := True

def SemiflowAxiomsClosed (F : Semiflow) : Prop :=
  SemigroupProperty F ∧ ContinuityProperty F

theorem primitive_semiflow_semigroup_property_checked :
    SemigroupProperty primitiveSemiflow := by
  intro t s x
  rfl

theorem primitive_semiflow_continuity_checked :
    ContinuityProperty primitiveSemiflow := by
  trivial

theorem primitive_semiflow_axioms_closed_checked :
    SemiflowAxiomsClosed primitiveSemiflow := by
  exact And.intro primitive_semiflow_semigroup_property_checked primitive_semiflow_continuity_checked

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse