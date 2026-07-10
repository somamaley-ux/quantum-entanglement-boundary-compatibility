import MaleyLean.Papers.QuantumEntanglementBoundaryCompatibility.PaperStatements

namespace MaleyLean
namespace Papers
namespace QuantumEntanglementBoundaryCompatibility

inductive BellSetting where
  | s0
  | s1
deriving DecidableEq, Repr

inductive BellOutcome where
  | minus
  | plus
deriving DecidableEq, Repr

structure FiniteBellTable where
  weight : BellSetting -> BellSetting -> BellOutcome -> BellOutcome -> Rat

structure FiniteEntanglementOperationalModel where
  table : FiniteBellTable
  tensorPreparation : Prop
  localMeasurementFamilies : Prop
  bornJointDistribution : Prop
  normalizedJointWeights : Prop
  noSignalingMarginals : Prop
  bellWitnessViolation : Prop
  stableSettingOutcomeChannels : Prop
  noOutcomeConditionedChannelChoice : Prop
  localRealizationOfJointProfile : Prop

def FiniteOperationalDynamicsReady (M : FiniteEntanglementOperationalModel) : Prop :=
  M.tensorPreparation /\
  M.localMeasurementFamilies /\
  M.bornJointDistribution /\
  M.normalizedJointWeights /\
  M.noSignalingMarginals /\
  M.bellWitnessViolation /\
  M.stableSettingOutcomeChannels /\
  M.noOutcomeConditionedChannelChoice /\
  M.localRealizationOfJointProfile

structure OperationalDynamicsBridge
    (M : FiniteEntanglementOperationalModel)
    (B : BellWitnessTarget) where
  physical_occurrence_from_born_model :
    FiniteOperationalDynamicsReady M -> B.physicalBellCorrelationOccurrence
  nondegenerate_witness_from_reusable_bell_table :
    FiniteOperationalDynamicsReady M -> B.nonDegenerateWitness
  fixed_scope_from_finite_settings :
    FiniteOperationalDynamicsReady M -> B.fixedBellScope
  boundary_trace_from_stable_channels :
    FiniteOperationalDynamicsReady M -> B.boundaryTraceFixed
  joint_standing_from_tensor_preparation :
    FiniteOperationalDynamicsReady M -> B.jointStandingClass
  tensor_compatibility_from_born_profile :
    FiniteOperationalDynamicsReady M -> B.tensorCompatibility
  ametric_costanding_from_no_transport_marginals :
    FiniteOperationalDynamicsReady M -> B.ametricCoStanding
  local_faces_from_measurement_families :
    FiniteOperationalDynamicsReady M -> B.localRealizationFaces
  no_signal_from_marginal_stability :
    FiniteOperationalDynamicsReady M -> B.noSameDomainSignalTyping
  no_metric_transport_from_local_sampling :
    FiniteOperationalDynamicsReady M -> B.noMetricTransportTyping
  no_marginal_modulation_from_no_signaling :
    FiniteOperationalDynamicsReady M -> B.noMarginalModulationTyping
  no_distant_repair_from_fixed_channels :
    FiniteOperationalDynamicsReady M -> B.noDistantRepairTyping
  no_hidden_authorizer_from_bell_violation :
    FiniteOperationalDynamicsReady M -> B.noHiddenLocalAuthorizerTyping
  no_delayed_calibration_from_stable_channels :
    FiniteOperationalDynamicsReady M -> B.noDelayedCalibrationRepairTyping
  no_extra_discriminator_from_fixed_scope :
    FiniteOperationalDynamicsReady M -> B.noExtraDiscriminatorTyping
  fail_closed_without_boundary_compatibility :
    FiniteOperationalDynamicsReady M -> ¬ BoundaryLevelCompatibility B ->
      B.failClosedWithoutBoundaryCompatibility

def BoundaryCompatibilityFromOperationalDynamics
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    BoundaryLevelCompatibility B :=
  And.intro (D.boundary_trace_from_stable_channels h) <|
    And.intro (D.joint_standing_from_tensor_preparation h) <|
      And.intro (D.tensor_compatibility_from_born_profile h) <|
        And.intro (D.ametric_costanding_from_no_transport_marginals h)
          (D.local_faces_from_measurement_families h)

def NoSignalingEndpointFromOperationalDynamics
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    NoSignalingEndpoint B :=
  And.intro (D.no_signal_from_marginal_stability h) <|
    And.intro (D.no_metric_transport_from_local_sampling h) <|
      And.intro (D.no_marginal_modulation_from_no_signaling h) <|
        And.intro (D.no_distant_repair_from_fixed_channels h) <|
          And.intro (D.no_hidden_authorizer_from_bell_violation h) <|
            And.intro (D.no_delayed_calibration_from_stable_channels h)
              (D.no_extra_discriminator_from_fixed_scope h)

def KernelCertificateFromOperationalDynamics
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (hready : FiniteOperationalDynamicsReady M) :
    BellWitnessKernelCertificate B where
  target_lives_on_fixed_scope := fun _ =>
    D.fixed_scope_from_finite_settings hready
  target_forces_boundary_level_compatibility := fun _ =>
    BoundaryCompatibilityFromOperationalDynamics D hready
  target_forces_no_signaling_endpoint := fun _ =>
    NoSignalingEndpointFromOperationalDynamics D hready
  missing_boundary_compatibility_is_fail_closed := fun _ hno =>
    D.fail_closed_without_boundary_compatibility hready hno
  physical_occurrence_needs_witness_role := fun _ _ =>
    And.intro
      (D.fixed_scope_from_finite_settings hready)
      (BoundaryCompatibilityFromOperationalDynamics D hready)

theorem PaperFiniteOperationalDynamicsProducesBellOccurrenceStatement
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    B.physicalBellCorrelationOccurrence :=
  D.physical_occurrence_from_born_model h

theorem PaperFiniteOperationalDynamicsProducesNDBellWitnessStatement
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    B.nonDegenerateWitness :=
  D.nondegenerate_witness_from_reusable_bell_table h

theorem PaperBornProfileForcesTensorCompatibilityStatement
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    B.tensorCompatibility :=
  D.tensor_compatibility_from_born_profile h

theorem PaperNoSignalingMarginalsForbidMarginalModulationStatement
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    B.noMarginalModulationTyping :=
  D.no_marginal_modulation_from_no_signaling h

theorem PaperTensorPreparationGivesJointStandingStatement
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    B.jointStandingClass :=
  D.joint_standing_from_tensor_preparation h

theorem PaperOperationalDynamicsBoundaryCompatibilityStatement
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    BoundaryLevelCompatibility B :=
  BoundaryCompatibilityFromOperationalDynamics D h

theorem PaperOperationalDynamicsNoSignalingEndpointStatement
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    NoSignalingEndpoint B :=
  NoSignalingEndpointFromOperationalDynamics D h

theorem PaperOperationalDynamicsInstantiatesBellWitnessSurfaceStatement
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (h : FiniteOperationalDynamicsReady M) :
    BoundaryLevelCompatibility B ∧ NoSignalingEndpoint B :=
  And.intro
    (PaperOperationalDynamicsBoundaryCompatibilityStatement D h)
    (PaperOperationalDynamicsNoSignalingEndpointStatement D h)

theorem PaperOperationalDynamicsKernelCertificateStatement
    {M : FiniteEntanglementOperationalModel}
    {B : BellWitnessTarget}
    (D : OperationalDynamicsBridge M B)
    (hready : FiniteOperationalDynamicsReady M)
    (hnd : B.nonDegenerateWitness) :
    BoundaryLevelCompatibility B ∧ NoSignalingEndpoint B :=
  PaperBellWitnessBoundaryCompatibilityAndNoSignalingStatement
    (KernelCertificateFromOperationalDynamics D hready)
    hnd

end QuantumEntanglementBoundaryCompatibility
end Papers
end MaleyLean
