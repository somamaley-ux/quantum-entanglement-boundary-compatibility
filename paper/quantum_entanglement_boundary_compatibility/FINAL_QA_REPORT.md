# Final QA report

## Manuscript build

- Source: `main.tex`
- Output: `main.pdf`
- Pages: 32
- Build engine: `pdflatex` via `latexmk`
- Build status: successful

## LaTeX checks

Final build log checked for:

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
