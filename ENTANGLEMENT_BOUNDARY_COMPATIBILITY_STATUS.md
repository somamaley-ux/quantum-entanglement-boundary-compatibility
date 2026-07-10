# Entanglement Boundary Compatibility Status

This repo packages a bounded Lean audit surface for:

`Quantum Entanglement as Boundary-Level Compatibility`

The manuscript is treated as the Bell-witness sister paper to the July 10
measurement-record determinacy snapshot.

## Lean Surface

The main module is:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility.lean`

It records the paper-facing route:

- physical Bell correlation occurrence is not by itself Bell-witness determinacy;
- non-degenerate Bell-witness use lives on a fixed Bell scope;
- the local target forces boundary-trace fixation, a joint standing class,
  tensor compatibility, AMetric co-standing, and local realization faces;
- the no-signaling endpoint excludes same-domain signal, metric transport,
  marginal modulation, distant repair, hidden local authorizer,
  delayed-calibration repair, and extra-discriminator typings;
- lack of boundary-level compatibility is fail-closed for the same target.

## Operational Dynamics Layer

The dynamics bridge module is:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/OperationalDynamics.lean`

It adds a finite Bell operational model with a Bell table, tensor preparation,
local measurement families, Born-style joint distribution, normalized joint
weights, stable no-signaling marginals, Bell-witness violation, stable
setting/outcome channels, and local realization of a joint profile.

The bridge theorem proves that a ready operational model instantiates the
existing boundary-level compatibility and no-signaling endpoint surface.

## Concrete Finite Derivation

The concrete derivation module is:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/ConcreteCHSHDerivation.lean`

It defines an explicit rational CHSH-style finite Bell table and proves:

- every setting pair has normalized joint weight;
- Alice and Bob marginals are uniform and no-signaling;
- the CHSH numerator is `80` over denominator `32`;
- the classical-bound numerator is `64`, leaving exact gap `16`.

## Bell-Local Envelope

The deterministic Bell-local envelope module is:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/BellLocalBound.lean`

It enumerates deterministic local assignments and proves every such assignment
has scaled CHSH numerator `64` or `-64`. The concrete finite table therefore
exceeds the positive deterministic Bell-local envelope by exact scaled gap
`16`.

## Singlet/Born Derivation

The finite singlet/Born derivation module is:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/SingletBornDerivation.lean`

It defines a finite Bell-scope singlet correlation profile with scaled
correlation numerators `+20` and `-20`, applies the two-outcome Born cell rule,
and proves the resulting weights match the concrete CHSH table exactly.

## Finite Geometry Profile

The finite geometry profile module is:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/FiniteGeometryProfile.lean`

It adds Alice/Bob measurement-axis labels and a scaled axis inner-product
profile. The singlet correlation is represented as the negative axis profile,
and the induced axis/Born weights are proved identical to the finite
singlet/Born table and the concrete CHSH table.

## Finite Vector Geometry

The finite vector geometry module is:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/FiniteVectorGeometry.lean`

It replaces bare axis labels with concrete integer 2D vectors, proves
Alice-axis squared norm `1` and Bob-axis squared norm `50`, proves the scaled
vector dot products match the finite axis profile, and derives the same
axis/Born and concrete CHSH weights.

## Derived Dynamics Spine

The released derived-dynamics module is:

`MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/DerivedDynamics.lean`

It adds a reusable integer CHSH functional over finite Bell tables, proves the
vector/Born table has CHSH numerator `80`, proves no-signaling from the
structural same/opposite Born symmetry rather than only from table
enumeration, builds deterministic local response tables from the 16 Alice/Bob
outcome assignments, classifies their CHSH extremes, enumerates the normalized
finite convex Bell-local envelope at denominator `32`, proves the vector/Born
numerator is outside that envelope and outside denominator-32 local
hidden-variable models, adds a general-denominator local-envelope interface,
factors the concrete vectors through a finite vector-geometry interface, and
supplies vector/Born bridge definitions back into the boundary-level
compatibility and no-signaling endpoint surface.

The endpoint theorem is:

`reasonableDeepestFiniteEntanglement_spine`

This is the satisfaction marker for the finite Bell-side flagship spine:
same/opposite two-outcome symmetry, concrete vector geometry, vector/Born CHSH
value `80`, deterministic-response local envelope, denominator-32
hidden-variable exclusion, general local-envelope interface, and the
boundary/no-signaling bridge.

## Paper Bundle

The hardened manuscript source and QA notes are staged at:

`paper/quantum_entanglement_boundary_compatibility/`

The staged `main.pdf` is the exact supplied July 10 target PDF from:

`G:\AASC corpus may 7\Core spine\ZZZNew Work\ZSubmission versions\Target\New Entanglement\Quantum_Entanglement_as_Boundary_Level_Compatibility.pdf`

## Claim Boundary

This is a manuscript-faithful finite Bell-side mechanization over declared
structures and hypotheses, now including finite vector/Born dynamics,
deterministic local response tables, a finite convex
Bell-local/hidden-variable envelope exclusion, and a general
finite-denominator envelope interface. It refines the public AASC
kernel/admissibility story at the Bell-witness endpoint; it does not claim a
first-principles derivation of Hilbert-space quantum mechanics, the continuum
Born rule, experimental Bell violation, or a complete constructive physical
mechanism for entanglement.
