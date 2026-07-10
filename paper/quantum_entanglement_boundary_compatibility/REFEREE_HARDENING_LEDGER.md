# Referee Hardening Ledger - v0.19.0

## Bounded correctness closure

### Act support was ill-typed

**Closure:** separated `SameActSupport(Phi)`, a proposition asserting equal endpoint support labels, from `ActSupp(Phi)`, the source act's value in `{A,B,AB}`. One-wing support now requires the proposition and the typed value.

### Canonical compatibility used the full continuation relation

**Closure:** the canonical raw compatibility datum now uses `K_P^act`, which is a relation on the active reuse carrier and is reflexively continuation-equivalent to itself. Compatibility certificate C5 is therefore satisfied directly.

### No-cost-free retyping overclassified unchanged targets as skin

**Closure:** the proof now distinguishes reference-bearing target preservation from governance equivalence. A proposal preserving the target remains a same-target rival for downstream classification; it is skin only when no target-active governance effect changes.

### Metric-authority proof covered only anchor admission

**Closure:** semantic effect exhaustion routes every metric-dependent governance change into a canonical effect channel. Because metric metadata is not a declared gate or target coordinate, such dependence is an excluded second invariant or selector; a null effect is skin.

## Correctness status

No further architectural expansion was introduced. The strong fixed-target endpoint, kernel dependency, Bell obstruction, compatibility certification, and target-active governance uniqueness are unchanged.
