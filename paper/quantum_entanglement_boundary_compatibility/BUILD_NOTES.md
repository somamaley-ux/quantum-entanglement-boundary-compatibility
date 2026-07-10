# Build Notes - v0.19.0

## Environment

The manuscript and revision memorandum were built from the LaTeX sources in this package using `pdflatex`.

## Commands

```bash
pdflatex -interaction=nonstopmode -halt-on-error main.tex
pdflatex -interaction=nonstopmode -halt-on-error main.tex
pdflatex -interaction=nonstopmode -halt-on-error main.tex

pdflatex -interaction=nonstopmode -halt-on-error revision_memorandum.tex
pdflatex -interaction=nonstopmode -halt-on-error revision_memorandum.tex
```

## Final build status

- `main.pdf`: 67 pages
- `revision_memorandum.pdf`: 1 page
- undefined references or citations: 0
- duplicate labels: 0
- overfull boxes: 0
- underfull boxes: 0
- fatal LaTeX errors: 0

## PDF verification

Both PDFs were preflighted and rendered page by page. They are openable, unencrypted, text-based, and use embedded fonts. The visual review covered the corrected act-support definitions, retyping theorem, metric-authority proof, compatibility certification, theorem blocks, displayed mathematics, tables, page breaks, references, and revision memorandum.

## Lean boundary

No fresh Lean build, axiom audit, or new formal theorem is claimed. The released v0.8.0 repository and DOI archive remain controlling for the finite mechanized layer and conditional endpoint bridge.
