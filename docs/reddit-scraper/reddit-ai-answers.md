# Reddit Answers Scraper: AI Answers With Sources

Sends your questions to Reddit Answers and returns each AI answer as markdown, with follow-up questions, source posts and source subreddits, so you can see what Reddit says about a product or topic.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 2 AI answers in 12 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-ai-answers](https://datapika.com/tasks/reddit-scraper/reddit-ai-answers)
- Input file: [`reddit-scraper/reddit-ai-answers.json`](../../reddit-scraper/reddit-ai-answers.json)

## Input

The exact JSON input of the "Reddit Answers Scraper: AI Answers With Sources" task. Change the values to make your own version.

```json
{
  "answerQueries": [
    "best budget mechanical keyboard",
    "is uv better than pip"
  ]
}
```

## Reddit Answers Scraper: AI Answers With Sources with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "answerQueries": [
    "best budget mechanical keyboard",
    "is uv better than pip"
  ]
}
JSON
```

## Reddit Answers Scraper: AI Answers With Sources with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "answerQueries": ["best budget mechanical keyboard", "is uv better than pip"],
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Reddit Answers Scraper: AI Answers With Sources with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "answerQueries": [
    "best budget mechanical keyboard",
    "is uv better than pip"
  ]
};
const run = await client.actor("openclawai/reddit-scraper").call(input, { maxTotalChargeUsd: 1 });
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

## Output fields

| Field | Column |
|---|---|
| `markdown` | Markdown |
| `follow_ups` | Follow ups |
| `source_posts` | Source posts |
| `source_subreddits` | Source subreddits |
| `queries_remaining` | Queries remaining |
| `query` | Query |

## Questions

### What is Reddit Answers?

Reddit's AI search that summarizes discussions. This task returns its answer and the Reddit posts it is based on.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, read it through the Apify API, or run the task from an AI agent through the Apify MCP server.
