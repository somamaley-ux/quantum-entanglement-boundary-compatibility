# Quantum Entanglement as Boundary-Level Compatibility

Standalone Lean 4 packaging and manuscript bundle for:

`Quantum Entanglement as Boundary-Level Compatibility`

Subtitle:

`A Kernel-Role Determinacy Theorem for No-Signaling, Bell Witness Fixation, and Tensor-Level Compatibility`

This repo contains:

- the Bell-witness theorem surface in `MaleyLean/Papers/QuantumEntanglementBoundaryCompatibility/PaperStatements.lean`
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
content, AMetric co-standing, and no-signaling endpoint exclusions. It does
not derive Hilbert-space quantum mechanics, the Born rule, Bell inequalities,
experimental violation, or a constructive dynamics for entanglement from first
principles.

The formalized endpoint is the manuscript-faithful Bell-side refinement:
non-degenerate reusable Bell-witness objecthood routes through boundary-level
compatibility carried by a joint standing class, and excludes same-domain
signal, metric-transport, marginal-modulation, distant-repair, hidden local
authorizer, delayed-calibration repair, and extra-discriminator typings.

This is Paper II of the AASC Quantum Determinacy Pair. The companion
measurement-record theorem supplies paired support and handoff context, not a
premise of the local Bell-witness proof.
