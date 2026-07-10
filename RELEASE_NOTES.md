# Release Notes

## v0.7.0 - finite vector geometry realization

This update adds the finite vector-geometry layer:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/FiniteVectorGeometry.lean`

The new module realizes the finite axis profile using concrete integer 2D
vectors, proves Alice-axis squared norm `1` and Bob-axis squared norm `50`,
proves scaled dot products match the axis profile, and derives the same
vector/Born weights and concrete CHSH table.

## v0.6.0 - finite axis geometry profile

This update adds the finite axis-geometry layer:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/FiniteGeometryProfile.lean`

The new module introduces Alice/Bob measurement-axis labels, a scaled
inner-product profile, and the singlet rule that the correlation is the
negative axis profile. It proves the axis/Born weights match both the finite
singlet/Born table and the concrete CHSH table exactly.

## v0.5.0 - finite singlet Born derivation

This update adds the finite singlet/Born derivation layer:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/SingletBornDerivation.lean`

The new module derives the concrete CHSH table from a finite singlet-style
correlation profile with scaled numerators `+20` and `-20`, using the
two-outcome Born cell rule. It proves the derived weights match the concrete
CHSH table exactly, preserve normalization, preserve no-signaling marginals,
and inherit the Bell-local envelope gap.

## v0.4.0 - deterministic Bell-local envelope

This update adds the Bell-local envelope layer:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/BellLocalBound.lean`

The new module proves that every deterministic local assignment has scaled
CHSH numerator `64` or `-64`, while the concrete finite table has numerator
`80`, giving exact positive-bound gap `16`.

## v0.3.0 - concrete finite CHSH derivation

This update pushes from operational bridge to concrete derivation:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/ConcreteCHSHDerivation.lean`

The new module defines an explicit rational CHSH-style finite Bell table and
proves normalization, uniform no-signaling marginals, CHSH numerator `80`,
and classical-bound gap `16` over denominator `32` directly from the table.

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
