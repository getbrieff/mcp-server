---
name: portfolio-analysis
description: >
  Analyze a portfolio of S&P 500 stocks for diversification, risk, and
  sector balance. Use when the user provides multiple tickers as a portfolio
  or asks about portfolio composition.
---

Analyze the following portfolio: $ARGUMENTS

For each company, use these Brieff tools:
1. get_company - Sector, market cap, beta, dividend yield
2. get_financials - Key financial metrics
3. get_geographic - Geographic exposure

Then synthesize a portfolio-level analysis:
- Sector allocation and concentration
- Geographic diversification across holdings
- Beta-weighted portfolio risk profile
- Dividend yield overview
- Overlapping geographic exposures across holdings
- Recommendations for improving diversification
