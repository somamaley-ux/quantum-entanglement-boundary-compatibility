# Build notes

## Environment

Built with `pdflatex`/`latexmk` under TeX Live in the container environment.

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
