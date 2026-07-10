# Final QA report

## Manuscript build

- Source: `main.tex`
- Output: `main.pdf`
- Pages: 32
- Build engine: `pdflatex` via `latexmk`
- Build status: supplied July 10 PDF artifact; source synchronized after this build

## LaTeX checks

The supplied July 10 build log was checked for:

- Undefined references: none found.
- Undefined citations: none found.
- Overfull hbox/vbox warnings: none found in final build.
- Fatal errors: none.

## PDF preflight

`pdfinfo main.pdf` reports:

- PDF opens successfully.
- PDF is not encrypted.
- Page count: 32.

## Render QA

All 32 manuscript pages rendered to PNG. Spot checks were performed on front matter, AMetric co-standing section, no-signaling endpoint section, closure-spine and kernel-role tables, the proof spine, CHSH audit, conclusion, and appendices. No clipped text, broken glyphs, black boxes, or visible table overlap were observed in spot checks.

## Presentation sweep

The final sweep makes no-signaling the flagship endpoint and develops the positive determinacy structure behind correlation without communication: AMetric co-standing and boundary co-fixation. It harmonizes mechanism-role and inadmissible role-reclassification language, keeps the AASC proof-class posture non-apologetic, and removes wording that could read as draft-like or hostile. The final pass explicitly distinguishes numerical no-signaling equations from the AASC no-signaling endpoint: no same-domain signal, transport, marginal-modulation, distant-repair, or environmental-oracle typing survives.

## Package QA

The final zip was created from a single clean root directory and tested with `unzip -t`.

## Final precision pass

- Added explicit `T_B` typing as Bell-scope tensor-compatibility content.
- Clarified statistical correlation language: individual pairs are local realizations; the family of pairs carries the Bell correlation structure.
- Clarified AMetric “before” as admissibility-priority, not temporal priority.
- Verified final build after precision edits: no undefined references, no undefined citations, and no overfull-box warnings.

## Lean synchronization pass

The `main.tex` and `revision_memorandum.tex` sources were synchronized with the
v0.8.0 derived-dynamics Lean spine. The manuscript source now explicitly names
`reasonableDeepestFiniteEntanglement_spine` and records the finite Bell-side
mechanized content: concrete vector geometry, vector/Born weights over
denominator `32`, structural no-signaling, CHSH numerator `80`, all 16
deterministic local response tables with CHSH numerator `64` or `-64`,
denominator-32 Bell-local/hidden-variable exclusion, and the bridge to the
boundary/no-signaling endpoint.

Local PDF rebuild was not performed during this synchronization pass because no
TeX engine (`pdflatex`, `xelatex`, `lualatex`, `latexmk`, or `tectonic`) is
installed on PATH or in the checked standard local locations. The staged PDFs
therefore remain the supplied July 10 compiled artifacts, while the TeX source
is the synchronized manuscript state.

The accompanying Lean repo passes `lake build MaleyLean`, the paper audit
script, and the Lean source scan for `sorry`, `admit`, and `unsafe`. The
deepest derived finite spine reports the standard Lean `propext` dependency in
equality/extensionality steps.
