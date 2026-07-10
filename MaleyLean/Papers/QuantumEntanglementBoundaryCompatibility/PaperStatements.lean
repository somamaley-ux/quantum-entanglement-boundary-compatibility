namespace MaleyLean
namespace Papers
namespace QuantumEntanglementBoundaryCompatibility

structure BellWitnessTarget where
  physicalBellCorrelationOccurrence : Prop
  nonDegenerateWitness : Prop
  fixedBellScope : Prop
  boundaryTraceFixed : Prop
  jointStandingClass : Prop
  tensorCompatibility : Prop
  ametricCoStanding : Prop
  localRealizationFaces : Prop
  noSameDomainSignalTyping : Prop
  noMetricTransportTyping : Prop
  noMarginalModulationTyping : Prop
  noDistantRepairTyping : Prop
  noHiddenLocalAuthorizerTyping : Prop
  noDelayedCalibrationRepairTyping : Prop
  noExtraDiscriminatorTyping : Prop
  failClosedWithoutBoundaryCompatibility : Prop

def BoundaryLevelCompatibility (B : BellWitnessTarget) : Prop :=
  B.boundaryTraceFixed ∧
  B.jointStandingClass ∧
  B.tensorCompatibility ∧
  B.ametricCoStanding ∧
  B.localRealizationFaces

def NoSignalingEndpoint (B : BellWitnessTarget) : Prop :=
  B.noSameDomainSignalTyping ∧
  B.noMetricTransportTyping ∧
  B.noMarginalModulationTyping ∧
  B.noDistantRepairTyping ∧
  B.noHiddenLocalAuthorizerTyping ∧
  B.noDelayedCalibrationRepairTyping ∧
  B.noExtraDiscriminatorTyping

structure BellWitnessKernelCertificate (B : BellWitnessTarget) where
  target_lives_on_fixed_scope :
    B.nonDegenerateWitness → B.fixedBellScope
  target_forces_boundary_level_compatibility :
    B.nonDegenerateWitness → BoundaryLevelCompatibility B
  target_forces_no_signaling_endpoint :
    B.nonDegenerateWitness → NoSignalingEndpoint B
  missing_boundary_compatibility_is_fail_closed :
    B.nonDegenerateWitness → ¬ BoundaryLevelCompatibility B →
      B.failClosedWithoutBoundaryCompatibility
  physical_occurrence_needs_witness_role :
    B.physicalBellCorrelationOccurrence → B.nonDegenerateWitness →
      B.fixedBellScope ∧ BoundaryLevelCompatibility B

theorem PaperPhysicalBellOccurrenceNeedsWitnessRoleStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (hphys : B.physicalBellCorrelationOccurrence)
    (hnd : B.nonDegenerateWitness) :
    B.fixedBellScope ∧ BoundaryLevelCompatibility B :=
  C.physical_occurrence_needs_witness_role hphys hnd

theorem PaperNDBellWitnessForcesFixedScopeStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.fixedBellScope :=
  C.target_lives_on_fixed_scope h

theorem PaperBoundaryLevelCompatibilityStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    BoundaryLevelCompatibility B :=
  C.target_forces_boundary_level_compatibility h

theorem PaperBellWitnessTraceFixationStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.boundaryTraceFixed :=
  (C.target_forces_boundary_level_compatibility h).1

theorem PaperJointStandingClassStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.jointStandingClass :=
  (C.target_forces_boundary_level_compatibility h).2.1

theorem PaperTensorCompatibilityStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.tensorCompatibility :=
  (C.target_forces_boundary_level_compatibility h).2.2.1

theorem PaperAMetricCoStandingStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.ametricCoStanding :=
  (C.target_forces_boundary_level_compatibility h).2.2.2.1

theorem PaperLocalRealizationFacesStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.localRealizationFaces :=
  (C.target_forces_boundary_level_compatibility h).2.2.2.2

theorem PaperNoSignalingEndpointStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    NoSignalingEndpoint B :=
  C.target_forces_no_signaling_endpoint h

theorem PaperNoSameDomainSignalTypingStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.noSameDomainSignalTyping :=
  (C.target_forces_no_signaling_endpoint h).1

theorem PaperNoMetricTransportTypingStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.noMetricTransportTyping :=
  (C.target_forces_no_signaling_endpoint h).2.1

theorem PaperNoMarginalModulationTypingStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.noMarginalModulationTyping :=
  (C.target_forces_no_signaling_endpoint h).2.2.1

theorem PaperNoDistantRepairTypingStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.noDistantRepairTyping :=
  (C.target_forces_no_signaling_endpoint h).2.2.2.1

theorem PaperNoHiddenLocalAuthorizerTypingStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.noHiddenLocalAuthorizerTyping :=
  (C.target_forces_no_signaling_endpoint h).2.2.2.2.1

theorem PaperNoDelayedCalibrationRepairTypingStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.noDelayedCalibrationRepairTyping :=
  (C.target_forces_no_signaling_endpoint h).2.2.2.2.2.1

theorem PaperNoExtraDiscriminatorTypingStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.noExtraDiscriminatorTyping :=
  (C.target_forces_no_signaling_endpoint h).2.2.2.2.2.2

theorem PaperFailClosedWithoutBoundaryCompatibilityStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (hnd : B.nonDegenerateWitness)
    (hno : ¬ BoundaryLevelCompatibility B) :
    B.failClosedWithoutBoundaryCompatibility :=
  C.missing_boundary_compatibility_is_fail_closed hnd hno

theorem PaperBellWitnessBoundaryCompatibilityAndNoSignalingStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    BoundaryLevelCompatibility B ∧ NoSignalingEndpoint B :=
  And.intro
    (PaperBoundaryLevelCompatibilityStatement C h)
    (PaperNoSignalingEndpointStatement C h)

theorem PaperQuantumDeterminacyPairBellSideStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.boundaryTraceFixed ∧ B.jointStandingClass ∧
      B.tensorCompatibility ∧ B.ametricCoStanding ∧
      NoSignalingEndpoint B :=
  And.intro (PaperBellWitnessTraceFixationStatement C h) <|
    And.intro (PaperJointStandingClassStatement C h) <|
      And.intro (PaperTensorCompatibilityStatement C h) <|
        And.intro (PaperAMetricCoStandingStatement C h)
          (PaperNoSignalingEndpointStatement C h)

end QuantumEntanglementBoundaryCompatibility
end Papers
end MaleyLean
