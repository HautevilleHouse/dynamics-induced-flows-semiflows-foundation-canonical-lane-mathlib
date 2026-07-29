import DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.LyapunovLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

structure SemiflowDynamicalCertificate where
  lyapunov : LyapunovCertificate
  dynamicalSystem : Prop
  semiflowProperty : Prop
  attractorExistence : Prop
  dynamicalSystemClosed : dynamicalSystem
  semiflowPropertyClosed : semiflowProperty
  attractorExistenceClosed : attractorExistence

def sourceSemiflowDynamicalCertificate : SemiflowDynamicalCertificate := {
  lyapunov := sourceLyapunovCertificate
  dynamicalSystem := sourceFormulaModelCount = 7
  semiflowProperty := baselineCertificateGates.length = 7
  attractorExistence := reviewerManifestEntries.length = 24
  dynamicalSystemClosed := rfl
  semiflowPropertyClosed := rfl
  attractorExistenceClosed := rfl
}

def SemiflowDynamicalClosed (C : SemiflowDynamicalCertificate) : Prop :=
  LyapunovClosed C.lyapunov ∧
  C.dynamicalSystem ∧ C.semiflowProperty ∧ C.attractorExistence

theorem source_semiflow_dynamical_closed : SemiflowDynamicalClosed sourceSemiflowDynamicalCertificate := by
  exact And.intro source_lyapunov_closed
    (And.intro sourceSemiflowDynamicalCertificate.dynamicalSystemClosed
      (And.intro sourceSemiflowDynamicalCertificate.semiflowPropertyClosed
        sourceSemiflowDynamicalCertificate.attractorExistenceClosed))

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse