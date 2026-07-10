# Release Notes

## v0.8.3 - Bell-nonlocal v0.19.0 manuscript snapshot

This update stages the supplied hardened manuscript package under the new title:

`Bell-Nonlocal Quantum Entanglement as Boundary-Level Compatibility`

Full manuscript title:

`Bell-Nonlocal Quantum Entanglement as Boundary-Level Compatibility: A Kernel-Role Determinacy Theorem for Bell-Witness Fixation, No-Signaling, and Tensor-Level Compatibility`

The staged paper bundle under
`paper/quantum_entanglement_boundary_compatibility/` now contains the v0.19.0
correctness-closure package: manuscript source, supplied compiled PDF,
revision memorandum, theorem-status map, Lean synchronization ledger, imported
theorem specialization ledger, governance representation ledger, referee
hardening ledger, package checksums, QA records, and release notes.

The v0.19.0 manuscript layer separates act-support equality from typed support
value, restricts canonical compatibility continuation to the active relation,
distinguishes target preservation from governance-inert skin in the retyping
proof, and completes metric-authority exclusion through semantic effect
exhaustion and second-invariant closure.

Lean boundary: no new Lean theorem is claimed by this manuscript snapshot. The
released Lean companion remains controlled by
`reasonableDeepestFiniteEntanglement_spine`, which verifies the finite
denominator-32 Bell carrier, vector/Born weights, structural no-signaling,
CHSH numerator `80`, deterministic local extrema, denominator-32
Bell-local/hidden-variable exclusion, and the conditional endpoint-routing
surface.

Boundary: the v0.19.0 correctness-closure theorem layer is manuscript-level.
It does not claim a new machine-checked theorem, Hilbert-space reconstruction,
continuum Born-rule derivation, Tsirelson-bound derivation, experimental Bell
violation derivation, or constructive physical mechanism for entanglement.

## v0.8.2 - manuscript source synchronized with derived dynamics spine

This release finalizes the repo/manuscript synchronization pass after the
v0.8.0 Lean deepening.

Human-facing manuscript source under
`paper/quantum_entanglement_boundary_compatibility/` now explicitly names the
strongest verified Lean endpoint:

`reasonableDeepestFiniteEntanglement_spine`

The manuscript source now forwards the finite Bell-side mechanization truthfully
and strongly: concrete vector geometry, vector/Born weights over denominator
`32`, structural no-signaling from the same/opposite two-outcome rule, CHSH
numerator `80`, deterministic local response tables with numerators `64` or
`-64`, denominator-32 Bell-local/hidden-variable exclusion, the general
finite-denominator local-envelope interface, and the bridge back to
boundary-level compatibility and the no-signaling endpoint.

Boundary: the Lean layer mechanizes this finite Bell-side witness spine and
its local-envelope exclusion. It does not claim a first-principles derivation
of Hilbert-space quantum mechanics, the continuum Born rule, Tsirelson's
bound, experimental Bell violation, or a complete constructive physical
mechanism for entanglement.

The existing staged PDFs remain the supplied July 10 compiled artifacts. The
TeX source is synchronized in this release; PDF rebuild was not performed in
this local environment because no TeX engine (`pdflatex`, `xelatex`,
`lualatex`, `latexmk`, or `tectonic`) is installed on PATH or in the checked
standard local locations.

Audit posture: `lake build MaleyLean`, the paper audit script, and the Lean
source scan pass. The deepest derived finite spine reports the standard Lean
`propext` dependency in equality/extensionality steps; the scan finds no
`sorry`, `admit`, or `unsafe`.

## v0.8.1 - manuscript synchronization patch plan

This release adds:

`docs/entanglement_manuscript_sync_patch_plan.md`

The handoff plan gives a section-by-section manuscript patch strategy for
synchronizing the paper with the v0.8.0 Lean mechanization centered on
`reasonableDeepestFiniteEntanglement_spine`. It is a planning artifact for the
next manuscript-source update; it does not itself replace the manuscript PDF or
claim that the manuscript text has already been synchronized.

## v0.8.0 - derived dynamics spine

This release adds:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/DerivedDynamics.lean`

This module defines a reusable integer CHSH functional over finite Bell
tables, proves the vector/Born table has CHSH numerator `80`, derives
no-signaling from the structural same/opposite Born symmetry, builds
deterministic local response tables from the 16 Alice/Bob outcome assignments,
classifies their CHSH extremes, enumerates the normalized finite convex
Bell-local envelope at denominator `32`, proves the vector/Born numerator is
outside that envelope and outside denominator-32 local hidden-variable models,
adds a general-denominator local-envelope interface, factors the concrete
vectors through a finite vector-geometry interface, and bridges the vector/Born
dynamics back into the boundary-compatibility and no-signaling endpoint
surface. The named endpoint theorem is
`reasonableDeepestFiniteEntanglement_spine`.

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
