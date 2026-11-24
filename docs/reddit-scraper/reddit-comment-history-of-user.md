# Reddit Comment History of Any User

Enter a username and get that user's recent comments with text, subreddit, score, permalink and date, plus their profile karma. Useful for research, moderation and vetting accounts.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 posts and 6 search results in 6 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-comment-history-of-user](https://datapika.com/tasks/reddit-scraper/reddit-comment-history-of-user)
- Input file: [`reddit-scraper/reddit-comment-history-of-user.json`](../../reddit-scraper/reddit-comment-history-of-user.json)

## Input

The exact JSON input of the "Reddit Comment History of Any User" task. Change the values to make your own version.

```json
{
  "users": [
    "GovSchwarzenegger"
  ],
  "maxItems": 100
}
```

## Reddit Comment History of Any User with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "users": [
    "GovSchwarzenegger"
  ],
  "maxItems": 100
}
JSON
```

## Reddit Comment History of Any User with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "users": ["GovSchwarzenegger"],
    "maxItems": 100,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Reddit Comment History of Any User with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "users": [
    "GovSchwarzenegger"
  ],
  "maxItems": 100
};
const run = await client.actor("openclawai/reddit-scraper").call(input, { maxTotalChargeUsd: 1 });
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

## Output fields

| Field | Column |
|---|---|
| `body` | Comment |
| `author` | Author |
| `score` | Score |
| `subreddit` | Subreddit |
| `postTitle` | Post |
| `createdAt` | Posted |
| `url` | Link |

## Questions

### How many comments can I get?

Up to what Reddit lists on the profile, usually around 1,000 recent items. maxItems caps the run.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, read it through the Apify API, or run the task from an AI agent through the Apify MCP server.
