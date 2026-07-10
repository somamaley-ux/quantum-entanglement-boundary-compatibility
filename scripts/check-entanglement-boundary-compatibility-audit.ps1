$ErrorActionPreference = "Stop"

lake build MaleyLean
lake env lean Checks\Axiom\QuantumEntanglementBoundaryCompatibilityAxiomCheck.lean

$hits = rg -n "\b(sorry|admit|unsafe)\b" -g "*.lean" MaleyLean Checks
if ($LASTEXITCODE -eq 0) {
  Write-Error "Forbidden Lean token found:`n$hits"
}
if ($LASTEXITCODE -gt 1) {
  exit $LASTEXITCODE
}

Write-Host "Entanglement boundary-compatibility audit passed."
