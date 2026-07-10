# Bell-Nonlocal Quantum Entanglement as Boundary-Level Compatibility

Standalone Lean 4 packaging and manuscript bundle for:

`Bell-Nonlocal Quantum Entanglement as Boundary-Level Compatibility`

Subtitle:

`A Kernel-Role Determinacy Theorem for Bell-Witness Fixation, No-Signaling, and Tensor-Level Compatibility`

This repo contains:

- the Bell-witness theorem surface in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/PaperStatements.lean`
- the finite operational dynamics bridge in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/OperationalDynamics.lean`
- the concrete finite CHSH derivation in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/ConcreteCHSHDerivation.lean`
- the deterministic Bell-local envelope proof in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/BellLocalBound.lean`
- the finite singlet/Born derivation in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/SingletBornDerivation.lean`
- the finite axis-geometry profile in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/FiniteGeometryProfile.lean`
- the finite vector-geometry realization in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/FiniteVectorGeometry.lean`
- the derived-dynamics spine in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/DerivedDynamics.lean`
- the public summary surface in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/Surface/Summary.lean`
- the paper-specific axiom audit in `Checks/Axiom/QuantumEntanglementBoundaryCompatibilityAxiomCheck.lean`
- the manuscript synchronization handoff plan in `docs/entanglement_manuscript_sync_patch_plan.md`
- the hardened manuscript bundle under `paper/quantum_entanglement_boundary_compatibility/`, updated to the v0.19.0 Bell-nonlocal title and correctness-closure package
- the exact supplied July 10 Bell-nonlocal target PDF staged as `paper/quantum_entanglement_boundary_compatibility/main.pdf`

## Build

```powershell
lake build MaleyLean
```

## Axiom Audit

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-entanglement-boundary-compatibility-audit.ps1
```

## Mechanization State

The strongest released Lean-supported spine remains:

`reasonableDeepestFiniteEntanglement_spine`

It bundles the finite Bell-side route from same/opposite two-outcome symmetry,
concrete integer vector geometry, vector/Born weights, CHSH numerator `80`,
deterministic local response tables, denominator-32 convex
Bell-local/hidden-variable exclusion, a general finite-denominator local
envelope interface, and the bridge back to boundary compatibility and the
no-signaling endpoint surface.

Current audit posture: the Lean build and paper audit pass, and the Lean source
scan finds no `sorry`, `admit`, or `unsafe`. The deepest derived finite spine
reports the standard Lean `propext` dependency in equality/extensionality
steps.

## Manuscript v0.19.0 State

The staged manuscript package is now:

`Bell-Nonlocal Quantum Entanglement as Boundary-Level Compatibility`

The package identifies itself as publication manuscript v0.19.0. It adds a
bounded correctness-closure layer at the manuscript level: typed act support,
active compatibility continuation, substantive metric-authority closure,
wing-complete standing-flow exclusion, target-bearing continuation uniqueness,
rival transport exhaustion, and the candidate-to-canonical standing-form
theorem. It keeps the strong endpoint: primitive same-target candidacy,
together with the activated kernel and exact imported closure spine, forces
one boundary-compatible target-bearing governance form up to target-active
extensional governance equivalence.

This v0.19.0 layer is not claimed as a new Lean theorem. The released Lean
companion remains v0.8.0/v0.8.2 for the finite denominator-32 Bell carrier and
conditional endpoint-routing surface.

## Claim Boundary

The Lean layer is a manuscript-faithful finite Bell-side mechanization over
declared Bell-witness roles, fixed-scope hypotheses, boundary-trace fixation,
tensor-compatibility content, AMetric co-standing, no-signaling endpoint
exclusions, finite vector/Born dynamics, and finite Bell-local
hidden-variable exclusion. It does not derive Hilbert-space quantum mechanics,
the continuum Born rule, experimental Bell violation, or a full constructive
physical mechanism for entanglement from first principles.

The formalized endpoint is the manuscript-faithful Bell-side refinement:
non-degenerate reusable Bell-witness objecthood routes through boundary-level
compatibility carried by a joint standing class, and excludes same-domain
signal, metric-transport, marginal-modulation, distant-repair, hidden local
authorizer, delayed-calibration repair, and extra-discriminator typings.

This is Paper II of the AASC Quantum Determinacy Pair. The companion
measurement-record theorem supplies paired support and handoff context, not a
premise of the local Bell-witness proof.

## Operational Dynamics Layer

The `OperationalDynamics` module adds the first deeper-dynamics layer: a
finite Bell table with tensor preparation, local measurement families,
Born-style joint distribution, stable no-signaling marginals, and local
realization of a joint profile. The bridge theorem then shows that such a
model instantiates the existing boundary-compatibility and no-signaling
endpoint surface.

The `ConcreteCHSHDerivation` module pushes one level deeper: it defines an
explicit rational CHSH-style table and proves normalization, uniform local
marginals, no-signaling, CHSH numerator `80`, and classical-bound gap `16`
over denominator `32` directly from that table.

The `BellLocalBound` module proves the deterministic Bell-local envelope:
every deterministic local assignment has scaled CHSH numerator `64` or `-64`.
The concrete table has numerator `80`, so the gap over the positive
deterministic bound is exactly `16`.

The `SingletBornDerivation` module derives the concrete table from a finite
singlet/Born-style correlation profile. It uses scaled correlation numerators
`+20` and `-20`, applies the two-outcome Born cell rule, and proves the derived
weights match the concrete CHSH table exactly.

The `FiniteGeometryProfile` module adds local measurement-axis labels and a
scaled axis inner-product profile. The singlet correlation is the negative
axis profile, and the resulting axis/Born weights are proved identical to the
finite singlet/Born and concrete CHSH tables.

The `FiniteVectorGeometry` module realizes the axis profile by concrete
integer 2D vectors, proves Alice-axis squared norm `1` and Bob-axis squared
norm `50`, proves the scaled vector dot products match the finite axis
profile, and carries the vector/Born weights through to the concrete CHSH
table.

The `DerivedDynamics` module is the released finite flagship spine. It defines
a reusable integer CHSH functional over finite Bell tables, proves the
vector/Born table has CHSH numerator `80`, derives no-signaling from the
structural same/opposite Born symmetry, builds actual deterministic local
response tables from the 16 Alice/Bob outcome assignments, classifies their
CHSH extremes, enumerates the normalized finite convex Bell-local envelope at
denominator `32`, proves the vector/Born numerator lies outside that envelope
and outside denominator-32 local hidden-variable models, adds a
general-denominator local-envelope interface, factors the concrete vectors
through a finite vector-geometry interface, and bridges the vector/Born
dynamics back into the boundary-compatibility and no-signaling endpoint
surface.
