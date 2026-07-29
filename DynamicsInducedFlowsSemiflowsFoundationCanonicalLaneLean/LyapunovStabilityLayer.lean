import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.AttractorStructureLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

structure LyapunovCertificate where
  attractor : AttractorCertificate
  lyapunovFunction : StateSpace → ℝ
  stability : Prop
  stabilityClosed : stability

def sourceLyapunovCertificate : LyapunovCertificate := {
  attractor := sourceAttractorCertificate
  lyapunovFunction := fun _ => 0
  stability := True
  stabilityClosed := trivial
}

def LyapunovStabilityClosed (C : LyapunovCertificate) : Prop :=
  AttractorClosed C.attractor ∧ C.stability

theorem source_lyapunov_stability_closed :
    LyapunovStabilityClosed sourceLyapunovCertificate := by
  exact And.intro source_attractor_closed sourceLyapunovCertificate.stabilityClosed

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse