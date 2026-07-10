# Quantum Entanglement as Boundary-Level Compatibility

## Audit-grade publication-final manuscript

**Title:** Quantum Entanglement as Boundary-Level Compatibility: A Kernel-Role Determinacy Theorem for No-Signaling, Bell Witness Fixation, and Tensor-Level Compatibility

This project contains the upgraded audit-grade LaTeX manuscript source and the staged compiled PDF supplied with the July 10 target bundle. It is built as Paper II of the paired AASC quantum determinacy arc:

1. **Measurement-record determinacy theorem:** non-degenerate evidential record objecthood requires admissible record-role fixation.
2. **Bell-witness determinacy theorem:** non-degenerate reusable Bell-witness objecthood requires boundary-level compatibility carried by a joint standing class, with no same-domain signaling, transport, distant-repair, or marginal-modulation typing.

The final version develops the explanatory core of the Bell theorem: **AMetric co-standing**. The outcomes are correlated because local measurements realize compatible faces of one boundary-cofixed joint standing class. They are not correlated by communication, metric transport, or distant-state repair.

## Files

- `main.tex` - LaTeX source.
- `main.pdf` - compiled manuscript.
- `revision_memorandum.tex` / `revision_memorandum.pdf` - audit-grade revision summary.
- `AMETRIC_COSTANDING_PATCH_PLAN.md` - final co-standing upgrade memo.
- `AUDIT_GRADE_PATCH_PLAN.md` - detailed patch plan that guided the initial upgrade.
- `NO_SIGNALING_FLAGSHIP_PATCH_PLAN.md` - no-signaling endpoint-strengthening patch plan.
- `FINAL_QA_REPORT.md` - build and preflight report.
- `CITATION_VERIFICATION.md` - citation verification notes.
- `BUILD_NOTES.md` - build commands and environment notes.
- `refs.bib` - bibliography mirror for external reference management.

## Lean synchronization

The manuscript source is synchronized with the repo's finite Bell-side Lean
mechanization through the endpoint
`reasonableDeepestFiniteEntanglement_spine`. The source now explicitly records
the verified vector/Born table over denominator `32`, CHSH numerator `80`,
structural no-signaling, all 16 deterministic local response tables with CHSH
numerator `64` or `-64`, denominator-32 Bell-local/hidden-variable exclusion,
and the boundary/no-signaling bridge.

The staged PDFs are the supplied July 10 compiled artifacts. After this source
synchronization pass, PDF rebuild requires a local TeX engine.

## Build

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error revision_memorandum.tex
```

No BibTeX is required because the manuscript currently uses an inline `thebibliography` environment. `refs.bib` is included as a convenience mirror.

## Final precision posture

The final version makes explicit that `T_B` is the Bell-scope tensor-compatibility content fixing the joint realization profile and operational probabilities. Individual outcome pairs are local realizations of that profile; the Bell correlation structure is carried by the family of such realization pairs. “Before” at the AMetric boundary means admissibility-priority, not temporal precedence.
