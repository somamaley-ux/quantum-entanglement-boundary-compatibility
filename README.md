# Quantum Entanglement as Boundary-Level Compatibility

Standalone Lean 4 packaging and manuscript bundle for:

`Quantum Entanglement as Boundary-Level Compatibility`

Subtitle:

`A Kernel-Role Determinacy Theorem for No-Signaling, Bell Witness Fixation, and Tensor-Level Compatibility`

This repo contains:

- the Bell-witness theorem surface in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/PaperStatements.lean`
- the finite operational dynamics bridge in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/OperationalDynamics.lean`
- the concrete finite CHSH derivation in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/ConcreteCHSHDerivation.lean`
- the public summary surface in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/Surface/Summary.lean`
- the paper-specific axiom audit in `Checks/Axiom/QuantumEntanglementBoundaryCompatibilityAxiomCheck.lean`
- the hardened manuscript bundle under `paper/quantum_entanglement_boundary_compatibility/`
- the exact supplied July 10 target PDF staged as `paper/quantum_entanglement_boundary_compatibility/main.pdf`

## Build

```powershell
lake build MaleyLean
```

## Axiom Audit

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-entanglement-boundary-compatibility-audit.ps1
```

## Claim Boundary

The Lean layer is an audit/formal-routing surface over declared Bell-witness
roles, fixed-scope hypotheses, boundary-trace fixation, tensor-compatibility
content, AMetric co-standing, no-signaling endpoint exclusions, and a finite
operational dynamics bridge. It does not derive Hilbert-space quantum
mechanics, the Born rule, Bell inequalities, experimental violation, or a full
constructive dynamics for entanglement from first principles.

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
