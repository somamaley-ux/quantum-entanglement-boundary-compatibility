# Release Notes

## v0.19.0 - Correctness closure

### Formal corrections

- Split the act-support equality predicate from the support value. `SameActSupport` is now a proposition, while `ActSupp` is a well-typed element of `{A,B,AB}`.
- Restricted the canonical compatibility continuation relation to the active carrier by defining it as `K_P^act`.
- Corrected the no-cost-free-retyping proof: preservation of reference-bearing target coordinates leaves a same-target governance proposal, not automatically skin.
- Completed the metric-authority proof through semantic effect exhaustion, no-second-invariant rigidity, AMetric no-selector closure, and same-scope operator closure.

### Endpoint

The corrections close the remaining local type and proof-routing defects without changing the endpoint. Every primitive candidate-admissible same-target construction has the unique boundary-compatible target-bearing governance form up to target-active extensional governance equivalence.

### Formalization boundary

No Lean code was changed. The released v0.8.0 Lean package remains controlling for the finite Bell witness and conditional bridge. The v0.19.0 correctness-closure layer remains manuscript-level.
