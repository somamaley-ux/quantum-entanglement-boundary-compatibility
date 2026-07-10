# Release Notes

## v0.1.0 - Entanglement boundary compatibility audit

Initial standalone release for:

`Quantum Entanglement as Boundary-Level Compatibility`

This release adds a bounded Lean 4 audit/formal-routing surface for the
Bell-witness sister paper in the AASC Quantum Determinacy Pair.

### Lean Surface

- `PaperPhysicalBellOccurrenceNeedsWitnessRoleStatement`
- `PaperNDBellWitnessForcesFixedScopeStatement`
- `PaperBoundaryLevelCompatibilityStatement`
- `PaperBellWitnessTraceFixationStatement`
- `PaperJointStandingClassStatement`
- `PaperTensorCompatibilityStatement`
- `PaperAMetricCoStandingStatement`
- `PaperLocalRealizationFacesStatement`
- `PaperNoSignalingEndpointStatement`
- `PaperNoSameDomainSignalTypingStatement`
- `PaperNoMetricTransportTypingStatement`
- `PaperNoMarginalModulationTypingStatement`
- `PaperNoDistantRepairTypingStatement`
- `PaperNoHiddenLocalAuthorizerTypingStatement`
- `PaperNoDelayedCalibrationRepairTypingStatement`
- `PaperNoExtraDiscriminatorTypingStatement`
- `PaperFailClosedWithoutBoundaryCompatibilityStatement`
- `PaperBellWitnessBoundaryCompatibilityAndNoSignalingStatement`
- `PaperQuantumDeterminacyPairBellSideStatement`
- `Surface.SummaryStatement`
- `Surface.PairedQuantumDeterminacySummaryStatement`

### Human-Facing Updates

- Staged the hardened manuscript bundle under
  `paper/quantum_entanglement_boundary_compatibility/`.
- Staged the exact supplied July 10 target PDF as the repo `main.pdf`.
- Added `ENTANGLEMENT_BOUNDARY_COMPATIBILITY_STATUS.md`.
- Added a focused axiom audit and audit script.

### Verification

- `lake build MaleyLean`
- `lake env lean Checks\Axiom\QuantumEntanglementBoundaryCompatibilityAxiomCheck.lean`
- PDF preflight: `main.pdf` 32 pages, unencrypted; `revision_memorandum.pdf` 2 pages, unencrypted.
- Sharp Lean scan found no `sorry`, `admit`, or `unsafe` tokens.

All listed endpoints report no axiom dependencies under the included audit.
