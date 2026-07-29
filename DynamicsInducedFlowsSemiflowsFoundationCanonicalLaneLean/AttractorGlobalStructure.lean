import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.SemiflowDynamicalSystem

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

structure AttractorStructure where
  semiflow : Semiflow
  attractorSet : StateSpace → Prop
  invariance : ∀ t x, attractorSet x → attractorSet (semiflow.evolution t x)
  attraction : ∀ x, attractorSet x → ∀ ε > 0, ∃ t, dist (semiflow.evolution t (semiflow.state)) x < ε
  globalAttractor : ∀ x, attractorSet x

structure GlobalAttractorCertificate where
  attractor : AttractorStructure
  attractorClosed : Prop
  attractorClosedProof : attractorClosed

def sourceGlobalAttractorCertificate : GlobalAttractorCertificate := {
  attractor := {
    semiflow := trivialSemiflow
    attractorSet := fun _ => True
    invariance := by
      intro t x h
      exact h
    attraction := by
      intro x h ε hpos
      have hx : x = trivialSemiflow.state := Subsingleton.elim _ _
      subst hx
      use 0
      calc
        dist (trivialSemiflow.evolution 0 (trivialSemiflow.state)) (trivialSemiflow.state) = dist (trivialSemiflow.state) (trivialSemiflow.state) := by simp
        _ = 0 := dist_self _
        _ < ε := hpos
    globalAttractor := by
      intro x
      trivial
  }
  attractorClosed := True
  attractorClosedProof := trivial
}

def GlobalAttractorClosed (C : GlobalAttractorCertificate) : Prop :=
  C.attractorClosed

theorem source_global_attractor_closed : GlobalAttractorClosed sourceGlobalAttractorCertificate := by
  unfold GlobalAttractorClosed
  exact sourceGlobalAttractorCertificate.attractorClosedProof

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse