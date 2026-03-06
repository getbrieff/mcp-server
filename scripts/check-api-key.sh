#!/bin/bash
if [ -z "$BRIEFF_API_KEY" ]; then
  echo "BRIEFF_API_KEY is not set. Brieff MCP tools will not work."
  echo "Get your API key at: https://getbrieff.com/en/dashboard"
  echo "Then set it: export BRIEFF_API_KEY=brff_your_key_here"
fi
exit 0
