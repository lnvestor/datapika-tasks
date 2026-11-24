# Reddit API Alternative: No API Key Needed

A Reddit API alternative: no app registration, API key or OAuth. This preset returns the week's top r/webdev posts with comments; change subreddits, searches or users for any public Reddit data.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 posts and 100 comments in 15 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-api-alternative-no-key](https://datapika.com/tasks/reddit-scraper/reddit-api-alternative-no-key)
- Input file: [`reddit-scraper/reddit-api-alternative-no-key.json`](../../reddit-scraper/reddit-api-alternative-no-key.json)

## Input

The exact JSON input of the "Reddit API Alternative: No API Key Needed" task. Change the values to make your own version.

```json
{
  "subreddits": [
    "webdev"
  ],
  "sort": "top",
  "time": "week",
  "includeComments": true,
  "maxCommentsPerPost": 20,
  "maxItems": 25
}
```

## Reddit API Alternative: No API Key Needed with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "subreddits": [
    "webdev"
  ],
  "sort": "top",
  "time": "week",
  "includeComments": true,
  "maxCommentsPerPost": 20,
  "maxItems": 25
}
JSON
```

## Reddit API Alternative: No API Key Needed with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "subreddits": ["webdev"],
    "sort": "top",
    "time": "week",
    "includeComments": True,
    "maxCommentsPerPost": 20,
    "maxItems": 25,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Reddit API Alternative: No API Key Needed with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "subreddits": [
    "webdev"
  ],
  "sort": "top",
  "time": "week",
  "includeComments": true,
  "maxCommentsPerPost": 20,
  "maxItems": 25
};
const run = await client.actor("openclawai/reddit-scraper").call(input, { maxTotalChargeUsd: 1 });
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

## Output fields

| Field | Column |
|---|---|
| `title` | Title |
| `subreddit` | Subreddit |
| `author` | Author |
| `score` | Score |
| `upvoteRatio` | Upvote % |
| `numComments` | Comments |
| `flair` | Flair |
| `createdAt` | Posted |
| `url` | Link |

## Questions

### Do I need to apply for Reddit API access?

No. It reads public Reddit data anonymously, so there is no app, key, OAuth flow or approval.

### How many comments do I get per post?

Set maxCommentsPerPost. Small threads come back complete; very big threads return about 120 to 220 comments per post, the top of the tree first.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, read it through the Apify API, or run the task from an AI agent through the Apify MCP server.
