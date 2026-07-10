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

## Paper Bundle

The hardened manuscript source and QA notes are staged at:

`paper/quantum_entanglement_boundary_compatibility/`

The staged `main.pdf` is the exact supplied July 10 target PDF from:

`G:\AASC corpus may 7\Core spine\ZZZNew Work\ZSubmission versions\Target\New Entanglement\Quantum_Entanglement_as_Boundary_Level_Compatibility.pdf`

## Claim Boundary

This is an audit/formal-routing surface over declared structures and
hypotheses, now including a finite operational dynamics bridge. It refines the
public AASC kernel/admissibility story at the Bell-witness endpoint; it does
not claim a first-principles derivation of quantum mechanics, Bell violation,
the Born rule, or a complete constructive physical mechanism for entanglement.
