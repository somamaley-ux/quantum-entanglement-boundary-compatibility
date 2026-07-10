# Build notes

## Environment

Built with `pdflatex`/`latexmk` under TeX Live in the container environment.

The v0.8.2 manuscript-source synchronization was performed in a Windows local
environment where no TeX engine (`pdflatex`, `xelatex`, `lualatex`, `latexmk`,
or `tectonic`) was available on PATH or in the checked standard install
locations. The TeX source is synchronized with the Lean repo state; rebuilding
the PDFs requires a TeX-enabled environment.

## Commands

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error revision_memorandum.tex
```

## PDF rendering

The final PDF was rendered to PNG pages using:

```bash
python /home/oai/skills/pdfs/scripts/render_pdf.py main.pdf --out_dir /mnt/data/qe_costanding_render_main --dpi 160
```

All 32 manuscript pages rendered successfully.

## Final co-standing patches

- Added AMetric co-standing and boundary co-fixation as the explicit account of correlation without communication.
- Added DOI-backed references for the AMetric Boundary and Boundary-Trace Fixation support papers.
- Strengthened the no-signaling endpoint theorem by routing correlation through boundary-cofixed joint standing before excluding signal/transport/repair/marginal-modulation typings.

## Final precision build

After the final precision pass, `main.pdf` and `revision_memorandum.pdf` were rebuilt with `latexmk -pdf -interaction=nonstopmode -halt-on-error`. The manuscript remains at 32 pages, and the revision memorandum is 2 pages.

## Lean synchronization source pass

After the v0.8.0 Lean deepening, `main.tex` and `revision_memorandum.tex` were
updated to name `reasonableDeepestFiniteEntanglement_spine` and describe the
verified finite Bell-side route: concrete vector geometry, vector/Born
denominator-32 weights, structural no-signaling, CHSH numerator `80`,
deterministic local response tables, denominator-32 Bell-local/hidden-variable
exclusion, the general finite-denominator envelope interface, and the
boundary/no-signaling bridge. No local PDF rebuild was possible in the Windows
environment used for this synchronization pass because no TeX engine was
installed.
