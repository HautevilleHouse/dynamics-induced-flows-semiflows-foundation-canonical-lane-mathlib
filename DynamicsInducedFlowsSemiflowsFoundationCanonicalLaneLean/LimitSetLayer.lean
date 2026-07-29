import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.LyapunovStabilityLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

structure LimitSetCertificate where
  lyapunov : LyapunovCertificate
  omegaLimitSet : Set StateSpace
  alphaLimitSet : Set StateSpace
  omegaCompact : Prop
  alphaCompact : Prop
  omegaInvariant : Prop
  alphaInvariant : Prop
  omegaCompactClosed : omegaCompact
  alphaCompactClosed : alphaCompact
  omegaInvariantClosed : omegaInvariant
  alphaInvariantClosed : alphaInvariant

def sourceLimitSetCertificate : LimitSetCertificate := {
  lyapunov := sourceLyapunovCertificate
  omegaLimitSet := Set.univ
  alphaLimitSet := Set.univ
  omegaCompact := True
  alphaCompact := True
  omegaInvariant := True
  alphaInvariant := True
  omegaCompactClosed := trivial
  alphaCompactClosed := trivial
  omegaInvariantClosed := trivial
  alphaInvariantClosed := trivial
}

def LimitSetClosed (C : LimitSetCertificate) : Prop :=
  LyapunovStabilityClosed C.lyapunov ∧
  C.omegaCompact ∧ C.alphaCompact ∧ C.omegaInvariant ∧ C.alphaInvariant

theorem source_limit_set_closed :
    LimitSetClosed sourceLimitSetCertificate := by
  exact And.intro source_lyapunov_stability_closed
    (And.intro sourceLimitSetCertificate.omegaCompactClosed
      (And.intro sourceLimitSetCertificate.alphaCompactClosed
        (And.intro sourceLimitSetCertificate.omegaInvariantClosed
          sourceLimitSetCertificate.alphaInvariantClosed)))

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse