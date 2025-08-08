#!/usr/bin/env bash
set -euo pipefail

cd /app

# Ensure camoufox browser is available (best-effort)
python -m camoufox fetch || true

exec python api_solver.py --browser_type camoufox --host 0.0.0.0 --port 5000 --headless True