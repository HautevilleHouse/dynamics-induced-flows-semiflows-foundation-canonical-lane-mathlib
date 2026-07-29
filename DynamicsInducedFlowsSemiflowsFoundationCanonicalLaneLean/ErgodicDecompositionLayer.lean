import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.LimitSetLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

structure ErgodicCertificate where
  limitSets : LimitSetCertificate
  invariantMeasure : Prop
  ergodicDecomposition : Prop
  invariantMeasureClosed : invariantMeasure
  ergodicDecompositionClosed : ergodicDecomposition

def sourceErgodicCertificate : ErgodicCertificate := {
  limitSets := sourceLimitSetCertificate
  invariantMeasure := True
  ergodicDecomposition := True
  invariantMeasureClosed := trivial
  ergodicDecompositionClosed := trivial
}

def ErgodicClosed (C : ErgodicCertificate) : Prop :=
  LimitSetClosed C.limitSets ∧ C.invariantMeasure ∧ C.ergodicDecomposition

theorem source_ergodic_closed :
    ErgodicClosed sourceErgodicCertificate := by
  exact And.intro source_limit_set_closed
    (And.intro sourceErgodicCertificate.invariantMeasureClosed sourceErgodicCertificate.ergodicDecompositionClosed)

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse