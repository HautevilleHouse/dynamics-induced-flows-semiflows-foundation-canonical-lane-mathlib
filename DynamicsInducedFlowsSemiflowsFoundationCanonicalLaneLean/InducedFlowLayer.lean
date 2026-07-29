import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.SemiflowStateSpace

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

structure InducedFlowCertificate where
  semiflow : Semiflow
  inducedMap : FlowMap
  consistency : Prop
  consistencyClosed : consistency
  semiflowAxiomsClosed : SemiflowAxiomsClosed semiflow

def sourceInducedFlowCertificate : InducedFlowCertificate := {
  semiflow := primitiveSemiflow
  inducedMap := fun t x => x
  consistency := True
  consistencyClosed := trivial
  semiflowAxiomsClosed := primitive_semiflow_axioms_closed_checked
}

def InducedFlowClosed (C : InducedFlowCertificate) : Prop :=
  C.consistency ∧ SemiflowAxiomsClosed C.semiflow

theorem source_induced_flow_closed :
    InducedFlowClosed sourceInducedFlowCertificate := by
  exact And.intro sourceInducedFlowCertificate.consistencyClosed sourceInducedFlowCertificate.semiflowAxiomsClosed

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse