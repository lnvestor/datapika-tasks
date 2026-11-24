# Subreddit Stats: Members, Description and Age

Searches communities for a topic and returns subreddit stats: subscriber count, description, creation date and URL for each, so you can compare community size before posting or advertising.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 subreddits in 9 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/subreddit-stats-members](https://datapika.com/tasks/reddit-scraper/subreddit-stats-members)
- Input file: [`reddit-scraper/subreddit-stats-members.json`](../../reddit-scraper/subreddit-stats-members.json)

## Input

The exact JSON input of the "Subreddit Stats: Members, Description and Age" task. Change the values to make your own version.

```json
{
  "searches": [
    "personal finance"
  ],
  "searchType": "communities",
  "maxItems": 25
}
```

## Subreddit Stats: Members, Description and Age with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "searches": [
    "personal finance"
  ],
  "searchType": "communities",
  "maxItems": 25
}
JSON
```

## Subreddit Stats: Members, Description and Age with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "searches": ["personal finance"],
    "searchType": "communities",
    "maxItems": 25,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Subreddit Stats: Members, Description and Age with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "searches": [
    "personal finance"
  ],
  "searchType": "communities",
  "maxItems": 25
};
const run = await client.actor("openclawai/reddit-scraper").call(input, { maxTotalChargeUsd: 1 });
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

## Output fields

| Field | Column |
|---|---|
| `name` | Subreddit |
| `title` | Title |
| `subscribers` | Subscribers |
| `activeUsers` | Online |
| `description` | Description |
| `isNsfw` | NSFW |
| `url` | Link |

## Questions

### Can I get stats for one exact subreddit?

Yes. Search its exact name; the matching community is returned with its member count.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, read it through the Apify API, or run the task from an AI agent through the Apify MCP server.
