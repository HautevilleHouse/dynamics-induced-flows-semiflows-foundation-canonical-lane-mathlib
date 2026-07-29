import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.SemiflowDynamicalSystem

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

structure OmegaLimitSet where
  semiflow : Semiflow
  x : StateSpace
  points : StateSpace → Prop
  omegaDef : points = fun y => ∀ (U : Set StateSpace) (hU : y ∈ U) (hOpen : IsOpen U), ∃ t, semiflow.evolution t (semiflow.state) ∈ U

def CompactnessCertificate : Prop :=
  ∀ (F : Semiflow) (x : StateSpace), IsCompact {y | OmegaLimitSet.mk F x}.points

structure OmegaLimitCompactCertificate where
  semiflow : Semiflow
  compactness : CompactnessCertificate
  compactnessProof : compactness

def sourceOmegaLimitCompactCertificate : OmegaLimitCompactCertificate := {
  semiflow := trivialSemiflow
  compactness := by
    intro F x
    exact IsCompact.singleton ()
  compactnessProof := trivial
}

def OmegaLimitCompactClosed (C : OmegaLimitCompactCertificate) : Prop :=
  C.compactness

theorem source_omega_limit_compact_closed : OmegaLimitCompactClosed sourceOmegaLimitCompactCertificate := by
  exact sourceOmegaLimitCompactCertificate.compactnessProof

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse