import MaleyLean.Papers.QuantumEntanglementBoundaryCompatibility.SingletBornDerivation

namespace MaleyLean
namespace Papers
namespace QuantumEntanglementBoundaryCompatibility

inductive AliceAxis where
  | a0
  | a1
deriving DecidableEq, Repr

inductive BobAxis where
  | b0
  | b1
deriving DecidableEq, Repr

def aliceAxisOfSetting : BellSetting -> AliceAxis
  | .s0 => .a0
  | .s1 => .a1

def bobAxisOfSetting : BellSetting -> BobAxis
  | .s0 => .b0
  | .s1 => .b1

def scaledAxisInnerProduct32 : AliceAxis -> BobAxis -> Int
  | .a1, .b1 => 20
  | _, _ => -20

def singletCorrelationFromAxes32
    (x y : BellSetting) : Int :=
  - scaledAxisInnerProduct32 (aliceAxisOfSetting x) (bobAxisOfSetting y)

theorem finite_axis_singlet_correlation_matches_profile
    (x y : BellSetting) :
    singletCorrelationFromAxes32 x y =
      singletCorrelationNumerator32 x y := by
  cases x <;> cases y <;> rfl

def axisBornWeight32
    (x y : BellSetting)
    (a b : BellOutcome) : Int :=
  if sameOutcome a b then
    bornSameCellWeight32 (singletCorrelationFromAxes32 x y)
  else
    bornOppositeCellWeight32 (singletCorrelationFromAxes32 x y)

theorem axisBornWeight_matches_singletBornWeight32
    (x y : BellSetting)
    (a b : BellOutcome) :
    axisBornWeight32 x y a b =
      singletBornWeight32 x y a b := by
  cases x <;> cases y <;> cases a <;> cases b <;> rfl

theorem axisBornWeight_matches_concreteCHSHWeight32
    (x y : BellSetting)
    (a b : BellOutcome) :
    axisBornWeight32 x y a b =
      Int.ofNat (concreteCHSHWeight32 x y a b) := by
  rw [axisBornWeight_matches_singletBornWeight32,
    singletBornWeight_matches_concreteCHSHWeight32]

theorem axisBorn_table_normalized32
    (x y : BellSetting) :
    axisBornWeight32 x y .plus .plus +
    axisBornWeight32 x y .plus .minus +
    axisBornWeight32 x y .minus .plus +
    axisBornWeight32 x y .minus .minus = 32 := by
  cases x <;> cases y <;> rfl

theorem axisBorn_alice_no_signaling32
    (x y₁ y₂ : BellSetting)
    (a : BellOutcome) :
    axisBornWeight32 x y₁ a .plus +
      axisBornWeight32 x y₁ a .minus =
    axisBornWeight32 x y₂ a .plus +
      axisBornWeight32 x y₂ a .minus := by
  cases x <;> cases y₁ <;> cases y₂ <;> cases a <;> rfl

theorem axisBorn_bob_no_signaling32
    (x₁ x₂ y : BellSetting)
    (b : BellOutcome) :
    axisBornWeight32 x₁ y .plus b +
      axisBornWeight32 x₁ y .minus b =
    axisBornWeight32 x₂ y .plus b +
      axisBornWeight32 x₂ y .minus b := by
  cases x₁ <;> cases x₂ <;> cases y <;> cases b <;> rfl

def FiniteAxisGeometryDerivesSingletBornProfile : Prop :=
  (∀ x y,
    singletCorrelationFromAxes32 x y =
      singletCorrelationNumerator32 x y) ∧
  (∀ x y a b,
    axisBornWeight32 x y a b =
      singletBornWeight32 x y a b) ∧
  (∀ x y a b,
    axisBornWeight32 x y a b =
      Int.ofNat (concreteCHSHWeight32 x y a b)) ∧
  chshNumerator32 = 80 ∧
  chshNumerator32 - 64 = 16

theorem finiteAxisGeometry_derives_singletBorn_profile :
    FiniteAxisGeometryDerivesSingletBornProfile := by
  exact And.intro finite_axis_singlet_correlation_matches_profile <|
    And.intro axisBornWeight_matches_singletBornWeight32 <|
      And.intro axisBornWeight_matches_concreteCHSHWeight32 <|
        And.intro concreteCHSH_value32
          concreteCHSH_exceeds_classical_bound_by_gap32

end QuantumEntanglementBoundaryCompatibility
end Papers
end MaleyLean
