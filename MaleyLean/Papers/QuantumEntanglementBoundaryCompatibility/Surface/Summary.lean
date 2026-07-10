import MaleyLean.Papers.QuantumEntanglementBoundaryCompatibility.PaperStatements

namespace MaleyLean
namespace Papers
namespace QuantumEntanglementBoundaryCompatibility
namespace Surface

theorem SummaryStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    BoundaryLevelCompatibility B ∧ NoSignalingEndpoint B :=
  PaperBellWitnessBoundaryCompatibilityAndNoSignalingStatement C h

theorem PairedQuantumDeterminacySummaryStatement
    {B : BellWitnessTarget}
    (C : BellWitnessKernelCertificate B)
    (h : B.nonDegenerateWitness) :
    B.boundaryTraceFixed ∧ B.jointStandingClass ∧
      B.tensorCompatibility ∧ B.ametricCoStanding ∧
      NoSignalingEndpoint B :=
  PaperQuantumDeterminacyPairBellSideStatement C h

end Surface
end QuantumEntanglementBoundaryCompatibility
end Papers
end MaleyLean
