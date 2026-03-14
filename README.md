<p align="center">
  <img src="assets/logo.png" width="80" height="80" alt="Brieff" />
</p>

<h1 align="center">Brieff</h1>

<p align="center">
  S&P 500 financial data, SEC filings, and AI-generated analysis for Claude.
</p>

<p align="center">
  <a href="https://getbrieff.com">Website</a> &middot;
  <a href="https://getbrieff.com/en/dashboard">Get API Key</a> &middot;
  <a href="https://modelcontextprotocol.io">MCP Docs</a>
</p>

---

## Quick Setup

### Option 1: Claude Code Plugin (Recommended)

```bash
claude plugin install brieff
```

On first use, your browser will open to sign in to your Brieff account and authorize access. No API key needed.

### Option 2: Claude Code (Manual MCP)

```bash
claude mcp add brieff --transport streamable-http https://getbrieff.com/api/mcp
```

### Option 3: Claude Desktop

Add to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "brieff": {
      "type": "streamable-http",
      "url": "https://getbrieff.com/api/mcp"
    }
  }
}
```

### Programmatic Access (For Developers)

For scripts, CI/CD pipelines, or direct API access, use an API key:

1. Go to [getbrieff.com/en/dashboard](https://getbrieff.com/en/dashboard)
2. Sign in and create a new API key (starts with `brff_`)
3. Use it with REST API endpoints (`/api/company`, `/api/filings`, etc.)

> **Migration note:** API key authentication for the MCP endpoint has been removed. If you were using an API key with the MCP plugin, reinstall the plugin and sign in via OAuth.

## Available Skills

Skills are guided analysis workflows you can invoke as slash commands. They orchestrate multiple tools to produce comprehensive results.

| Skill | Usage | Description |
|-------|-------|-------------|
| `company-analysis` | `/brieff:company-analysis AAPL` | Full company deep-dive: overview, financials, commentary, filings, geographic breakdown |
| `filing-summary` | `/brieff:filing-summary 0000320193-24-000123` | Summarize signals and risks from a specific SEC filing |
| `sector-comparison` | `/brieff:sector-comparison AAPL,MSFT,GOOGL` | Side-by-side comparison of multiple companies |
| `geographic-risk` | `/brieff:geographic-risk AAPL` | Analyze geographic revenue concentration and geopolitical risk |
| `financial-health` | `/brieff:financial-health AAPL` | Deep-dive into debt, margins, cash flow, and solvency |
| `portfolio-analysis` | `/brieff:portfolio-analysis AAPL,MSFT,GOOGL,AMZN` | Analyze portfolio diversification, sector balance, and risk |
| `earnings-alert` | `/brieff:earnings-alert` | Scan recent filings for notable signals and earnings surprises |

## Financial Analyst Agent

The plugin includes a `financial-analyst` agent that Claude automatically delegates to when it detects a financial analysis task. The agent:

- Knows all 9 Brieff tools and when to use each one
- Searches for companies by name if no ticker is provided
- Formats financial figures properly ($1.2B, not 1200000000)
- Presents both strengths and risks objectively
- Never provides investment advice - data and analysis only

You can also invoke it explicitly:

```
Use the financial-analyst agent to analyze NVIDIA's latest earnings
```

## Available Tools

| Tool | Input | Description |
|------|-------|-------------|
| `get_company` | `ticker` | Company overview: price, market cap, sector, P/E, 52-week range, beta, dividend yield |
| `get_financials` | `ticker` | Financial statements: income statement, balance sheet, cash flow |
| `get_filings` | `ticker` | List SEC filings (10-K, 10-Q, 8-K, etc.) |
| `get_filing_signals` | `accession_number` | AI-generated signals and risk factors from a specific filing |
| `get_geographic` | `ticker`, `fiscal_year?` | Geographic revenue breakdown by region/country |
| `get_rankings` | - | S&P 500 rankings: revenue, net income, market cap, EPS, FCF, operating cash flow, total assets, D/E |
| `get_commentary` | `ticker` | AI-generated commentary with scores: valuation, profitability, growth, financial health, dividends |
| `search_companies` | `query` | Search S&P 500 companies by name or ticker |
| `get_latest_filings` | `limit?`, `offset?`, `form_types?`, `query?` | Paginated recent SEC filings with optional filtering |

## Available Prompts

Prompts are multi-step analysis workflows that guide Claude through a structured research process.

| Prompt | Input | What it does |
|--------|-------|--------------|
| `company-analysis` | `ticker` | Full company deep-dive: overview, financials, commentary, filings, geographic breakdown |
| `filing-summary` | `accession_number` | Summarize and synthesize signals from a specific SEC filing |
| `sector-comparison` | comma-separated tickers | Side-by-side comparison of multiple companies |
| `geographic-risk-analysis` | `ticker` | Geopolitical risk analysis based on geographic revenue exposure |
| `financial-health-check` | `ticker` | Deep-dive into debt, margins, and cash flow health |

## Example Usage

Once configured, you can ask Claude things like:

- "Analyze Apple's latest financial performance"
- "Compare MSFT, GOOGL, and AMZN side by side"
- "What are the key risk factors in Tesla's latest 10-K?"
- "Which S&P 500 companies have the highest free cash flow?"
- "Show me NVIDIA's geographic revenue breakdown"
- "Analyze my portfolio: AAPL, MSFT, GOOGL, AMZN, NVDA"
- "Any notable signals in recent SEC filings?"

## How It Works

Brieff uses the [Model Context Protocol](https://modelcontextprotocol.io) to give Claude direct access to financial data. Data is sourced from SEC EDGAR filings and Yahoo Finance, covering all S&P 500 companies.

```
Claude <-> MCP Protocol <-> Brieff API <-> SEC EDGAR + Yahoo Finance
```

## License

MIT
