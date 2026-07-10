# Entanglement Manuscript Synchronization Patch Plan

## Objective

Update the entanglement manuscript so it is synchronized with the released v0.8.0 Lean mechanization in:

`quantum-entanglement-boundary-compatibility`

The manuscript should forward the strongest truthful framing of the current mechanization state, centered on the named Lean endpoint:

`reasonableDeepestFiniteEntanglement_spine`

## Strongest Truthful Framing

The manuscript is now supported by a finite Bell-side Lean mechanization:

concrete integer vector geometry -> vector/Born table -> structural no-signaling -> CHSH numerator `80` -> deterministic local response tables -> denominator-32 Bell-local/hidden-variable exclusion -> general finite-denominator envelope interface -> boundary/no-signaling bridge.

This should be presented as a manuscript-faithful finite Bell-side mechanization, not merely as an audit stub.

## Boundary To Preserve

Do not claim that the Lean layer derives:

- Hilbert-space quantum mechanics from first principles;
- the continuum Born rule;
- Tsirelson's bound;
- experimental Bell violation;
- a complete constructive physical mechanism for entanglement.

The correct boundary is:

The Lean layer mechanizes the finite Bell-side determinacy spine and local-envelope exclusions used by the manuscript, while the manuscript remains the controlling exposition of the AASC determinacy theorem.

## Files To Patch

Primary:

- `paper/quantum_entanglement_boundary_compatibility/main.tex`
- `paper/quantum_entanglement_boundary_compatibility/revision_memorandum.tex`

Optional after rebuilding:

- `paper/quantum_entanglement_boundary_compatibility/main.pdf`
- source ZIP / release assets

## Patch 1: Abstract

In `main.tex`, patch the abstract after the first paragraph.

Add:

```latex
The accompanying Lean formalization now verifies a finite Bell-side spine:
concrete vector geometry, vector/Born weights, structural no-signaling, CHSH
violation over denominator `32`, deterministic local response tables, finite
Bell-local/hidden-variable exclusion, and the boundary/no-signaling bridge.
```

Purpose: signal immediately that the manuscript has a finite mechanized spine.

## Patch 2: Main Result Box

In the boxed `Main result`, add one final sentence:

```latex
In the finite mechanized layer, this route is witnessed by
`reasonableDeepestFiniteEntanglement_spine`, which bundles the vector/Born CHSH
table, deterministic local-envelope exclusion, and boundary/no-signaling
endpoint.
```

Purpose: give readers the exact Lean anchor.

## Patch 3: Proof-Class Posture

In the paragraph beginning `AASC is used here as a constraint formalism...`, add:

```latex
The Lean layer should be read in this proof-class posture: it mechanizes the
finite Bell-side determinacy spine and its local-envelope exclusions, not a
lower-level reconstruction of quantum theory.
```

Purpose: preserve the strong mechanization claim while keeping the boundary clear.

## Patch 4: Proof Spine List

In the `Proof spine` enumerated list, add a new item between the current Bell-local closure item and the boundary-trace/no-signaling item:

```latex
\item The finite mechanized Bell table is generated through concrete vector
geometry and same/opposite Born weights; its CHSH numerator is `80` over
denominator `32`, while deterministic local response tables and denominator-32
local hidden-variable models remain inside the finite Bell-local envelope.
```

Then renumber naturally.

Purpose: this is the most important manuscript synchronization point.

## Patch 5: Introduction

After the paragraph ending roughly:

`If a proposed mechanism, interpretation, or reconstruction violates those requirements, it does not preserve the same Bell target.`

Add:

```latex
The present release includes a finite Lean mechanization of this Bell-side
route. It does not replace the manuscript proof, but it verifies the finite
operational spine used by the theorem: a concrete vector/Born table,
structural no-signaling marginals, exact CHSH numerator `80`, deterministic
local response tables, denominator-32 Bell-local/hidden-variable exclusion,
and a bridge from that finite dynamics layer back to boundary-level
compatibility.
```

## Patch 6: Bell Scope Section

After the CHSH expression definition in Section 2 / fixed Bell scope, add a finite denominator note:

```latex
In the mechanized finite model, probabilities are represented by integer
weights over denominator `32`. The vector/Born table has CHSH numerator `80`,
corresponding to a value above the Bell-local numerator bound `64`.
```

Purpose: connect the manuscript's notation to the Lean integer scaling.

## Patch 7: Add A New Subsection

Add a new subsection near the Bell-scope / CHSH / hidden-variable discussion:

```latex
\subsection{Finite mechanized Bell-side spine}
```

Content outline:

1. Denominator-32 finite representation:
   - probabilities are represented as integer weights over denominator `32`;
   - CHSH is represented as an integer numerator.

2. Concrete vector geometry:
   - Alice vectors have squared norm `1`;
   - Bob vectors have squared norm `50`;
   - scaled dot products recover the finite axis profile.

3. Vector/Born table:
   - same/opposite two-outcome symmetry;
   - structural no-signaling follows because each local marginal is same-plus-opposite, independent of the remote setting.

4. CHSH and local envelope:
   - vector/Born CHSH numerator is `80`;
   - deterministic local response tables have numerator `64` or `-64`;
   - denominator-32 local hidden-variable models remain inside the finite local envelope;
   - vector/Born table is outside that envelope.

5. Boundary bridge:
   - the finite dynamics layer bridges back to boundary-level compatibility and the no-signaling endpoint surface.

Suggested paragraph:

```latex
The Lean companion mechanizes a finite Bell-side spine for the theorem. It
uses integer weights over denominator `32`, concrete integer plane vectors for
the local axes, and a same/opposite two-outcome Born rule to generate the
finite vector/Born table. The resulting table has CHSH numerator `80`; every
deterministic local response table has numerator `64` or `-64`; and
denominator-32 local hidden-variable models remain inside the finite
Bell-local envelope. The vector/Born table is therefore outside that finite
local envelope. The named endpoint
`reasonableDeepestFiniteEntanglement_spine` bundles this finite route together
with the boundary/no-signaling bridge.
```

## Patch 8: Hidden Variables Section

Where the manuscript says hidden variables fail, add hidden load, or change scope, strengthen with:

```latex
The Lean layer verifies this at the finite Bell-table level. All 16
deterministic Alice/Bob response assignments are represented as deterministic
local tables. Each such table has CHSH numerator `64` or `-64`.
Denominator-32 mixtures remain inside the finite local envelope, while the
vector/Born table has numerator `80` and is outside that envelope.
```

Purpose: strongest truthful Bell-local mechanization statement.

## Patch 9: No-Signaling Section

Where the manuscript says no-signaling is fixed witness input, add:

```latex
In the finite mechanized layer, no-signaling is also derived structurally for
the vector/Born table from same/opposite two-outcome symmetry: each local
marginal is the same-plus-opposite sum, independent of the remote setting.
```

Purpose: upgrade no-signaling from merely table-checked to structurally verified for the finite vector/Born table.

## Patch 10: Appendix Certificate

In `Bell-scope certificate in one page`, add bullets:

```latex
\item The finite vector/Born table has CHSH numerator `80` over denominator `32`.
\item The 16 deterministic local response tables have CHSH numerator `64` or `-64`.
\item Denominator-32 local hidden-variable models cannot represent the vector/Born table.
\item The Lean endpoint is `reasonableDeepestFiniteEntanglement_spine`.
```

Purpose: quick-audit readers see the actual mechanized additions.

## Patch 11: Non-Claim Guide

Replace or refine the existing non-claim bullet about not deriving quantum theory:

```latex
\item Not a lower derivation of quantum theory: the finite vector/Born layer
mechanizes a Bell-side witness table and its local-envelope exclusion; it does
not derive Hilbert-space quantum mechanics, the continuum Born rule, or
Tsirelson's bound.
```

Purpose: avoid making the mechanization sound weaker than it is, while keeping the boundary exact.

## Patch 12: Reference Integrity / Publication Notes

In the section currently saying auxiliary formalizations are audit support rather than substitutes, strengthen to:

```latex
The Lean formalization is a finite mechanized companion to the theorem chain.
It verifies the Bell-side finite dynamics and local-envelope exclusion used by
the manuscript, while the manuscript remains the controlling exposition of the
AASC determinacy theorem.
```

Purpose: stronger than “audit support,” still not replacing the manuscript.

## Patch 13: Revision Memorandum

In `revision_memorandum.tex`, add a major-change bullet:

```latex
\item Synchronized the manuscript with the v0.8.0 Lean formalization,
including the named endpoint `reasonableDeepestFiniteEntanglement_spine`.
```

Add a new section:

```latex
\section*{Lean synchronization}
```

Suggested text:

```latex
The manuscript is synchronized with the v0.8.0 Lean companion. The new
formalization layer is `DerivedDynamics.lean`, whose strongest named endpoint
is `reasonableDeepestFiniteEntanglement_spine`. It verifies the finite
Bell-side spine: concrete vector geometry, vector/Born weights, structural
no-signaling, CHSH numerator `80`, deterministic local response tables,
denominator-32 Bell-local/hidden-variable exclusion, a general
finite-denominator envelope interface, and the bridge back to boundary-level
compatibility and the no-signaling endpoint. The Lean audit reports no
`sorry`, `admit`, or `unsafe`.
```

## Patch 14: Optional Terminology Cleanup

Search for stale or weak phrasing:

- `auxiliary formalizations`
- `audit support`
- `merely`
- `only`
- `unreleased`
- `local development`

Recommended replacements:

- `finite mechanized companion`
- `finite Bell-side mechanization`
- `Lean-supported endpoint`
- `released finite flagship spine`
- `manuscript-faithful mechanization`

Do not remove useful limitations. Keep clear non-claims.

## Patch 15: QA After Editing

After patching:

1. Rebuild the PDF from `main.tex`.
2. Render/inspect the PDF for overfull boxes and table/page breaks.
3. Re-run Lean validation:

```powershell
lake build MaleyLean
lake env lean Checks\Axiom\QuantumEntanglementBoundaryCompatibilityAxiomCheck.lean
powershell -ExecutionPolicy Bypass -File scripts\check-entanglement-boundary-compatibility-audit.ps1
rg -n "\b(sorry|admit|unsafe)\b" -g "*.lean" MaleyLean Checks
```

4. Preflight PDFs:

```powershell
@'
from pathlib import Path
from pypdf import PdfReader
for p in [Path('paper/quantum_entanglement_boundary_compatibility/main.pdf'), Path('paper/quantum_entanglement_boundary_compatibility/revision_memorandum.pdf')]:
    r = PdfReader(str(p))
    print(f'{p}: pages={len(r.pages)}, encrypted={r.is_encrypted}, bytes={p.stat().st_size}')
'@ | & 'C:\Users\admin\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' -
```

## Suggested Release Framing

If releasing after the manuscript sync, use `v0.8.1`.

Suggested title:

`v0.8.1 - manuscript synchronization with derived dynamics spine`

Suggested release summary:

```text
This release synchronizes the manuscript with the v0.8.0 Lean-derived dynamics
spine. The paper now explicitly reflects the finite Bell-side mechanization
centered on `reasonableDeepestFiniteEntanglement_spine`: concrete vector
geometry, vector/Born weights, structural no-signaling, CHSH numerator `80`,
deterministic local response tables, denominator-32 Bell-local/hidden-variable
exclusion, a general finite-denominator local-envelope interface, and the
boundary/no-signaling bridge.

Boundary preserved: the release does not claim a first-principles derivation
of Hilbert-space quantum mechanics, the continuum Born rule, Tsirelson's
bound, experimental Bell violation, or a complete constructive physical
mechanism for entanglement.
```

