---
name: earnings-alert
description: >
  Scan recent SEC filings for notable signals and earnings surprises.
  Use when the user asks about recent market activity, latest filings,
  or wants to find interesting earnings reports.
---

Scan recent SEC filings for notable signals using Brieff tools:

1. get_latest_filings - Get the most recent filings (use form_types ["10-K", "10-Q"] for earnings)
2. For each filing with signals, use get_filing_signals to extract details

Then present a summary:
- Filings with the most significant signals (positive and negative)
- Notable risk factor changes
- Any earnings surprises or unusual patterns
- Sort by signal significance, most notable first
