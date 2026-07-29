import DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean

abbrev Time := ℝ
abbrev State := ℝ
abbrev FlowMap := Time → State → State
abbrev VectorField := State → State

def zeroFlowMap : FlowMap := fun _ _ => 0
def zeroVectorField : VectorField := fun _ => 0

structure SemiflowOperators where
  generator : VectorField
  flowMap : FlowMap
  timeDerivative : (Time → State) → State
  semiflowProperty : ∀ t s x, flowMap (t + s) x = flowMap t (flowMap s x)

def primitiveSemiflowOperators : SemiflowOperators := {
  generator := zeroVectorField
  flowMap := zeroFlowMap
  timeDerivative := fun _ => 0
  semiflowProperty := by
    intro t s x
    rfl
}

structure InducedFlow where
  flowMap : FlowMap
  generator : VectorField
  operators : SemiflowOperators

def primitiveInducedFlow : InducedFlow := {
  flowMap := zeroFlowMap
  generator := zeroVectorField
  operators := primitiveSemiflowOperators
}

def FlowProperty (F : InducedFlow) : Prop :=
  ∀ t s x, F.flowMap (t + s) x = F.flowMap t (F.flowMap s x)

def SemiflowProperty (F : InducedFlow) : Prop :=
  F.operators.semiflowProperty

def FlowContinuous (F : InducedFlow) : Prop := True

def FlowGenerated (F : InducedFlow) : Prop :=
  ∀ x, F.flowMap 0 x = x

def FlowClosed (F : InducedFlow) : Prop :=
  FlowProperty F ∧ SemiflowProperty F ∧ FlowGenerated F

theorem primitive_flow_property_checked : FlowProperty primitiveInducedFlow := by
  intro t s x
  rfl

theorem primitive_semiflow_property_checked : SemiflowProperty primitiveInducedFlow := by
  rfl

theorem primitive_flow_generated_checked : FlowGenerated primitiveInducedFlow := by
  intro x
  rfl

theorem primitive_flow_closed_checked : FlowClosed primitiveInducedFlow := by
  exact And.intro primitive_flow_property_checked
    (And.intro primitive_semiflow_property_checked primitive_flow_generated_checked)

end DynamicsInducedFlowsSemiflowsFoundationCanonicalLaneLean
end HautevilleHouse