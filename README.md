<p align="center">
  <img src="assets/logo.png" width="80" height="80" alt="Brieff" />
</p>

<h1 align="center">Brieff MCP Server</h1>

<p align="center">
  Access S&P 500 financial data, SEC filings, and AI-generated analysis from Claude.
</p>

<p align="center">
  <a href="https://getbrieff.com">Website</a> &middot;
  <a href="https://getbrieff.com/en/dashboard">Get API Key</a> &middot;
  <a href="https://modelcontextprotocol.io">MCP Docs</a>
</p>

---

## Quick Setup

### Claude Desktop

Add to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "brieff": {
      "type": "streamable-http",
      "url": "https://getbrieff.com/api/mcp",
      "headers": {
        "Authorization": "Bearer YOUR_API_KEY"
      }
    }
  }
}
```

### Claude Code

```bash
claude mcp add brieff --transport streamable-http https://getbrieff.com/api/mcp \
  -h "Authorization: Bearer YOUR_API_KEY"
```

## Get an API Key

1. Go to [getbrieff.com/en/dashboard](https://getbrieff.com/en/dashboard)
2. Sign in with your email
3. Create a new API key
4. Copy the key (starts with `brff_`) - it won't be shown again

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

## How It Works

Brieff's MCP server uses the [Model Context Protocol](https://modelcontextprotocol.io) to give Claude direct access to financial data. Data is sourced from SEC EDGAR filings and Yahoo Finance, covering all S&P 500 companies.

```
Claude <-> MCP Protocol <-> Brieff API <-> SEC EDGAR + Yahoo Finance
```

## License

MIT
