---
name: company-analysis
description: >
  Comprehensive S&P 500 company analysis. Use when the user asks to analyze
  a company, evaluate a stock, or wants a full overview of a company's
  financial position.
---

Perform a comprehensive analysis of $ARGUMENTS using Brieff tools in this order:

1. get_company - Company info, price, market data
2. get_financials - Income statement, balance sheet, cash flow
3. get_commentary - AI-generated scoring and commentary
4. get_filings - Recent SEC filings
5. get_geographic - Geographic revenue breakdown

After gathering all data, synthesize a comprehensive analysis covering:
- Company overview and current market position
- Financial health assessment
- Key strengths and risks
- Geographic diversification
- Recent SEC filing highlights
