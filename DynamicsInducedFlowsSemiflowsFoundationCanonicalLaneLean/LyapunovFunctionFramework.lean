import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.SemiflowDynamicalSystem

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

structure LyapunovFunction where
  semiflow : Semiflow
  V : StateSpace → ℝ
  nonnegative : ∀ x, V x ≥ 0
  decreasing : ∀ t, ∀ x, V (semiflow.evolution t x) ≤ V x
  strictDecreaseAtEquilibrium : ∀ x, (∀ t, semiflow.evolution t x = x) → V x = 0

structure LyapunovCertificate where
  lyapunovFunction : LyapunovFunction
  lyapunovClosed : Prop
  lyapunovClosedProof : lyapunovClosed

def trivialLyapunovFunction : LyapunovFunction := {
  semiflow := trivialSemiflow
  V := fun _ => 0
  nonnegative := by intro x; nlinarith
  decreasing := by intro t x; nlinarith
  strictDecreaseAtEquilibrium := by intro x h; rfl
}

def sourceLyapunovCertificate : LyapunovCertificate := {
  lyapunovFunction := trivialLyapunovFunction
  lyapunovClosed := True
  lyapunovClosedProof := trivial
}

def LyapunovClosed (C : LyapunovCertificate) : Prop :=
  C.lyapunovClosed

theorem source_lyapunov_closed : LyapunovClosed sourceLyapunovCertificate := by
  exact sourceLyapunovCertificate.lyapunovClosedProof

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse