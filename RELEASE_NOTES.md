# Release Notes

## v0.2.0 - finite operational dynamics bridge

This update adds the first deeper-dynamics layer:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/OperationalDynamics.lean`

The new module records a finite Bell operational model with tensor
preparation, local measurement families, Born-style joint distribution,
normalized joint weights, stable no-signaling marginals, Bell-witness
violation, stable setting/outcome channels, and local realization of a joint
profile.

The bridge theorem shows that such an operational model instantiates the
existing boundary-level compatibility and no-signaling endpoint surface.

New audit endpoints:

- `PaperFiniteOperationalDynamicsProducesBellOccurrenceStatement`
- `PaperFiniteOperationalDynamicsProducesNDBellWitnessStatement`
- `PaperBornProfileForcesTensorCompatibilityStatement`
- `PaperNoSignalingMarginalsForbidMarginalModulationStatement`
- `PaperTensorPreparationGivesJointStandingStatement`
- `PaperOperationalDynamicsBoundaryCompatibilityStatement`
- `PaperOperationalDynamicsNoSignalingEndpointStatement`
- `PaperOperationalDynamicsInstantiatesBellWitnessSurfaceStatement`
- `PaperOperationalDynamicsKernelCertificateStatement`

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
