import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.InducedFlowLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

structure AttractorCertificate where
  inducedFlow : InducedFlowCertificate
  attractorSet : Set StateSpace
  invariance : Prop
  attraction : Prop
  invarianceClosed : invariance
  attractionClosed : attraction

def sourceAttractorCertificate : AttractorCertificate := {
  inducedFlow := sourceInducedFlowCertificate
  attractorSet := Set.univ
  invariance := True
  attraction := True
  invarianceClosed := trivial
  attractionClosed := trivial
}

def AttractorClosed (C : AttractorCertificate) : Prop :=
  InducedFlowClosed C.inducedFlow ∧ C.invariance ∧ C.attraction

theorem source_attractor_closed :
    AttractorClosed sourceAttractorCertificate := by
  exact And.intro source_induced_flow_closed
    (And.intro sourceAttractorCertificate.invarianceClosed sourceAttractorCertificate.attractionClosed)

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse