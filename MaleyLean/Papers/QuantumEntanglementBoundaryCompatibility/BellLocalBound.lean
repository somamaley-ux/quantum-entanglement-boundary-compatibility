import MaleyLean.Papers.QuantumEntanglementBoundaryCompatibility.ConcreteCHSHDerivation

namespace MaleyLean
namespace Papers
namespace QuantumEntanglementBoundaryCompatibility

structure DeterministicLocalAssignment where
  alice0 : BellOutcome
  alice1 : BellOutcome
  bob0 : BellOutcome
  bob1 : BellOutcome

def aliceValue (L : DeterministicLocalAssignment) : BellSetting -> BellOutcome
  | .s0 => L.alice0
  | .s1 => L.alice1

def bobValue (L : DeterministicLocalAssignment) : BellSetting -> BellOutcome
  | .s0 => L.bob0
  | .s1 => L.bob1

def deterministicCorrelator
    (L : DeterministicLocalAssignment)
    (x y : BellSetting) : Int :=
  outcomeSign (aliceValue L x) * outcomeSign (bobValue L y)

def deterministicCHSHRaw (L : DeterministicLocalAssignment) : Int :=
  deterministicCorrelator L .s0 .s0 +
  deterministicCorrelator L .s0 .s1 +
  deterministicCorrelator L .s1 .s0 -
  deterministicCorrelator L .s1 .s1

def deterministicCHSHNumerator32
    (L : DeterministicLocalAssignment) : Int :=
  32 * deterministicCHSHRaw L

def BellLocalDeterministicBound32 (L : DeterministicLocalAssignment) : Prop :=
  deterministicCHSHNumerator32 L = 64 ∨
  deterministicCHSHNumerator32 L = -64

theorem deterministicCHSHRaw_is_plus_or_minus_two
    (L : DeterministicLocalAssignment) :
    deterministicCHSHRaw L = 2 ∨ deterministicCHSHRaw L = -2 := by
  cases L with
  | mk a0 a1 b0 b1 =>
    cases a0 <;> cases a1 <;> cases b0 <;> cases b1 <;>
      first | exact Or.inl rfl | exact Or.inr rfl

theorem deterministicBellLocalBound32
    (L : DeterministicLocalAssignment) :
    BellLocalDeterministicBound32 L := by
  cases deterministicCHSHRaw_is_plus_or_minus_two L with
  | inl h =>
      left
      unfold deterministicCHSHNumerator32
      rw [h]
      rfl
  | inr h =>
      right
      unfold deterministicCHSHNumerator32
      rw [h]
      rfl

theorem concreteCHSH_exceeds_positive_deterministic_bound_by_gap32 :
    chshNumerator32 - 64 = 16 :=
  concreteCHSH_exceeds_classical_bound_by_gap32

def ConcreteCHSHExceedsBellLocalEnvelope : Prop :=
  (∀ L : DeterministicLocalAssignment, BellLocalDeterministicBound32 L) ∧
  chshNumerator32 = 80 ∧
  chshNumerator32 - 64 = 16

theorem concreteCHSH_exceeds_bell_local_envelope :
    ConcreteCHSHExceedsBellLocalEnvelope := by
  exact And.intro deterministicBellLocalBound32 <|
    And.intro concreteCHSH_value32
      concreteCHSH_exceeds_positive_deterministic_bound_by_gap32

end QuantumEntanglementBoundaryCompatibility
end Papers
end MaleyLean
