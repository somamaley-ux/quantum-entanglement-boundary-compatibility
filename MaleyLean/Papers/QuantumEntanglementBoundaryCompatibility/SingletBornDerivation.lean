import MaleyLean.Papers.QuantumEntanglementBoundaryCompatibility.BellLocalBound

namespace MaleyLean
namespace Papers
namespace QuantumEntanglementBoundaryCompatibility

def singletCorrelationNumerator32
    (x y : BellSetting) : Int :=
  if chshPositiveCorrelationTarget x y then
    20
  else
    -20

def bornSameCellWeight32 (corr : Int) : Int :=
  (32 + corr) / 4

def bornOppositeCellWeight32 (corr : Int) : Int :=
  (32 - corr) / 4

def singletBornWeight32
    (x y : BellSetting)
    (a b : BellOutcome) : Int :=
  if sameOutcome a b then
    bornSameCellWeight32 (singletCorrelationNumerator32 x y)
  else
    bornOppositeCellWeight32 (singletCorrelationNumerator32 x y)

theorem singletBorn_positive_same_weight32
    {x y : BellSetting}
    (h : chshPositiveCorrelationTarget x y = true)
    {a b : BellOutcome}
    (hs : sameOutcome a b = true) :
    singletBornWeight32 x y a b = 13 := by
  unfold singletBornWeight32 bornSameCellWeight32 singletCorrelationNumerator32
  rw [hs, h]
  rfl

theorem singletBorn_positive_opposite_weight32
    {x y : BellSetting}
    (h : chshPositiveCorrelationTarget x y = true)
    {a b : BellOutcome}
    (hs : sameOutcome a b = false) :
    singletBornWeight32 x y a b = 3 := by
  unfold singletBornWeight32 bornOppositeCellWeight32 singletCorrelationNumerator32
  rw [hs, h]
  rfl

theorem singletBorn_negative_same_weight32
    {x y : BellSetting}
    (h : chshPositiveCorrelationTarget x y = false)
    {a b : BellOutcome}
    (hs : sameOutcome a b = true) :
    singletBornWeight32 x y a b = 3 := by
  unfold singletBornWeight32 bornSameCellWeight32 singletCorrelationNumerator32
  rw [hs, h]
  rfl

theorem singletBorn_negative_opposite_weight32
    {x y : BellSetting}
    (h : chshPositiveCorrelationTarget x y = false)
    {a b : BellOutcome}
    (hs : sameOutcome a b = false) :
    singletBornWeight32 x y a b = 13 := by
  unfold singletBornWeight32 bornOppositeCellWeight32 singletCorrelationNumerator32
  rw [hs, h]
  rfl

theorem singletBornWeight_matches_concreteCHSHWeight32
    (x y : BellSetting)
    (a b : BellOutcome) :
    singletBornWeight32 x y a b =
      Int.ofNat (concreteCHSHWeight32 x y a b) := by
  cases x <;> cases y <;> cases a <;> cases b <;> rfl

theorem singletBorn_table_normalized32
    (x y : BellSetting) :
    singletBornWeight32 x y .plus .plus +
    singletBornWeight32 x y .plus .minus +
    singletBornWeight32 x y .minus .plus +
    singletBornWeight32 x y .minus .minus = 32 := by
  cases x <;> cases y <;> rfl

theorem singletBorn_alice_uniform_marginal32
    (x y : BellSetting)
    (a : BellOutcome) :
    singletBornWeight32 x y a .plus +
    singletBornWeight32 x y a .minus = 16 := by
  cases x <;> cases y <;> cases a <;> rfl

theorem singletBorn_bob_uniform_marginal32
    (x y : BellSetting)
    (b : BellOutcome) :
    singletBornWeight32 x y .plus b +
    singletBornWeight32 x y .minus b = 16 := by
  cases x <;> cases y <;> cases b <;> rfl

theorem singletBorn_alice_no_signaling32
    (x y₁ y₂ : BellSetting)
    (a : BellOutcome) :
    singletBornWeight32 x y₁ a .plus +
      singletBornWeight32 x y₁ a .minus =
    singletBornWeight32 x y₂ a .plus +
      singletBornWeight32 x y₂ a .minus := by
  rw [singletBorn_alice_uniform_marginal32 x y₁ a,
    singletBorn_alice_uniform_marginal32 x y₂ a]

theorem singletBorn_bob_no_signaling32
    (x₁ x₂ y : BellSetting)
    (b : BellOutcome) :
    singletBornWeight32 x₁ y .plus b +
      singletBornWeight32 x₁ y .minus b =
    singletBornWeight32 x₂ y .plus b +
      singletBornWeight32 x₂ y .minus b := by
  rw [singletBorn_bob_uniform_marginal32 x₁ y b,
    singletBorn_bob_uniform_marginal32 x₂ y b]

def SingletBornDerivesConcreteCHSHTable : Prop :=
  (∀ x y a b,
    singletBornWeight32 x y a b =
      Int.ofNat (concreteCHSHWeight32 x y a b)) ∧
  (∀ x y,
    singletBornWeight32 x y .plus .plus +
    singletBornWeight32 x y .plus .minus +
    singletBornWeight32 x y .minus .plus +
    singletBornWeight32 x y .minus .minus = 32) ∧
  (∀ x y₁ y₂ a,
    singletBornWeight32 x y₁ a .plus +
      singletBornWeight32 x y₁ a .minus =
    singletBornWeight32 x y₂ a .plus +
      singletBornWeight32 x y₂ a .minus) ∧
  (∀ x₁ x₂ y b,
    singletBornWeight32 x₁ y .plus b +
      singletBornWeight32 x₁ y .minus b =
    singletBornWeight32 x₂ y .plus b +
      singletBornWeight32 x₂ y .minus b) ∧
  chshNumerator32 = 80 ∧
  chshNumerator32 - 64 = 16

theorem singletBorn_derives_concreteCHSH_table :
    SingletBornDerivesConcreteCHSHTable := by
  exact And.intro
    singletBornWeight_matches_concreteCHSHWeight32 <|
    And.intro singletBorn_table_normalized32 <|
      And.intro singletBorn_alice_no_signaling32 <|
        And.intro singletBorn_bob_no_signaling32 <|
          And.intro concreteCHSH_value32
            concreteCHSH_exceeds_classical_bound_by_gap32

theorem singletBorn_derives_bell_local_gap :
    ConcreteCHSHExceedsBellLocalEnvelope :=
  concreteCHSH_exceeds_bell_local_envelope

end QuantumEntanglementBoundaryCompatibility
end Papers
end MaleyLean
