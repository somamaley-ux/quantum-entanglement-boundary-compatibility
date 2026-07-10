import MaleyLean.Papers.QuantumEntanglementBoundaryCompatibility.OperationalDynamics

namespace MaleyLean
namespace Papers
namespace QuantumEntanglementBoundaryCompatibility

def sameOutcome : BellOutcome -> BellOutcome -> Bool
  | .plus, .plus => true
  | .minus, .minus => true
  | _, _ => false

def chshPositiveCorrelationTarget : BellSetting -> BellSetting -> Bool
  | .s1, .s1 => false
  | _, _ => true

def concreteCHSHWeight32
    (x y : BellSetting)
    (a b : BellOutcome) : Nat :=
  if sameOutcome a b = chshPositiveCorrelationTarget x y then
    13
  else
    3

def concreteCHSHWeight
    (x y : BellSetting)
    (a b : BellOutcome) : Rat :=
  (concreteCHSHWeight32 x y a b : Rat) / 32

def concreteCHSHTable : FiniteBellTable where
  weight := concreteCHSHWeight

def jointWeightSum32 (x y : BellSetting) : Nat :=
  concreteCHSHWeight32 x y .plus .plus +
  concreteCHSHWeight32 x y .plus .minus +
  concreteCHSHWeight32 x y .minus .plus +
  concreteCHSHWeight32 x y .minus .minus

def aliceMarginal32
    (x y : BellSetting)
    (a : BellOutcome) : Nat :=
  concreteCHSHWeight32 x y a .plus +
  concreteCHSHWeight32 x y a .minus

def bobMarginal32
    (x y : BellSetting)
    (b : BellOutcome) : Nat :=
  concreteCHSHWeight32 x y .plus b +
  concreteCHSHWeight32 x y .minus b

def outcomeSign : BellOutcome -> Int
  | .plus => 1
  | .minus => -1

def signedWeight
    (x y : BellSetting)
    (a b : BellOutcome) : Int :=
  outcomeSign a * outcomeSign b *
    Int.ofNat (concreteCHSHWeight32 x y a b)

def correlatorNumerator32 (x y : BellSetting) : Int :=
  signedWeight x y .plus .plus +
  signedWeight x y .plus .minus +
  signedWeight x y .minus .plus +
  signedWeight x y .minus .minus

def chshNumerator32 : Int :=
  correlatorNumerator32 .s0 .s0 +
  correlatorNumerator32 .s0 .s1 +
  correlatorNumerator32 .s1 .s0 -
  correlatorNumerator32 .s1 .s1

theorem concreteCHSH_normalized32
    (x y : BellSetting) :
    jointWeightSum32 x y = 32 := by
  cases x <;> cases y <;> rfl

theorem concreteCHSH_alice_uniform_marginal32
    (x y : BellSetting)
    (a : BellOutcome) :
    aliceMarginal32 x y a = 16 := by
  cases x <;> cases y <;> cases a <;> rfl

theorem concreteCHSH_bob_uniform_marginal32
    (x y : BellSetting)
    (b : BellOutcome) :
    bobMarginal32 x y b = 16 := by
  cases x <;> cases y <;> cases b <;> rfl

theorem concreteCHSH_alice_no_signaling32
    (x y₁ y₂ : BellSetting)
    (a : BellOutcome) :
    aliceMarginal32 x y₁ a =
      aliceMarginal32 x y₂ a := by
  rw [concreteCHSH_alice_uniform_marginal32 x y₁ a,
    concreteCHSH_alice_uniform_marginal32 x y₂ a]

theorem concreteCHSH_bob_no_signaling32
    (x₁ x₂ y : BellSetting)
    (b : BellOutcome) :
    bobMarginal32 x₁ y b =
      bobMarginal32 x₂ y b := by
  rw [concreteCHSH_bob_uniform_marginal32 x₁ y b,
    concreteCHSH_bob_uniform_marginal32 x₂ y b]

theorem concreteCHSH_correlator_positive32
    (x y : BellSetting)
    (h : chshPositiveCorrelationTarget x y = true) :
    correlatorNumerator32 x y = 20 := by
  cases x <;> cases y <;> simp [chshPositiveCorrelationTarget] at h
  all_goals rfl

theorem concreteCHSH_correlator_negative32 :
    correlatorNumerator32 .s1 .s1 = -20 := by
  rfl

theorem concreteCHSH_value32 :
    chshNumerator32 = 80 := by
  rfl

theorem concreteCHSH_exceeds_classical_bound_by_gap32 :
    chshNumerator32 - 64 = 16 := by
  rfl

def ConcreteCHSHDerivedFacts : Prop :=
  (∀ x y, jointWeightSum32 x y = 32) ∧
  (∀ x y₁ y₂ a,
    aliceMarginal32 x y₁ a = aliceMarginal32 x y₂ a) ∧
  (∀ x₁ x₂ y b,
    bobMarginal32 x₁ y b = bobMarginal32 x₂ y b) ∧
  chshNumerator32 = 80 ∧
  chshNumerator32 - 64 = 16

theorem concreteCHSH_derived_facts :
    ConcreteCHSHDerivedFacts := by
  exact And.intro
    concreteCHSH_normalized32
    (And.intro
      concreteCHSH_alice_no_signaling32
      (And.intro
        concreteCHSH_bob_no_signaling32
        (And.intro concreteCHSH_value32
          concreteCHSH_exceeds_classical_bound_by_gap32)))

structure ConcreteCHSHToOperationalModel
    (M : FiniteEntanglementOperationalModel) where
  table_is_concrete_chsh : M.table = concreteCHSHTable
  tensor_preparation : M.tensorPreparation
  local_measurement_families : M.localMeasurementFamilies
  born_joint_distribution_from_table : M.bornJointDistribution
  normalized_joint_weights_from_derivation :
    ConcreteCHSHDerivedFacts -> M.normalizedJointWeights
  no_signaling_marginals_from_derivation :
    ConcreteCHSHDerivedFacts -> M.noSignalingMarginals
  bell_witness_violation_from_derivation :
    ConcreteCHSHDerivedFacts -> M.bellWitnessViolation
  stable_channels_from_table : M.stableSettingOutcomeChannels
  no_outcome_conditioned_channel_choice : M.noOutcomeConditionedChannelChoice
  local_realization_of_joint_profile : M.localRealizationOfJointProfile

def FiniteOperationalDynamicsReadyFromConcreteCHSH
    {M : FiniteEntanglementOperationalModel}
    (C : ConcreteCHSHToOperationalModel M) :
    FiniteOperationalDynamicsReady M :=
  And.intro C.tensor_preparation <|
    And.intro C.local_measurement_families <|
      And.intro C.born_joint_distribution_from_table <|
        And.intro
          (C.normalized_joint_weights_from_derivation
            concreteCHSH_derived_facts) <|
          And.intro
            (C.no_signaling_marginals_from_derivation
              concreteCHSH_derived_facts) <|
            And.intro
              (C.bell_witness_violation_from_derivation
                concreteCHSH_derived_facts) <|
              And.intro C.stable_channels_from_table <|
                And.intro C.no_outcome_conditioned_channel_choice
                  C.local_realization_of_joint_profile

end QuantumEntanglementBoundaryCompatibility
end Papers
end MaleyLean
