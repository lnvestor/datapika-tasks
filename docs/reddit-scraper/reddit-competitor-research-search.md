# Reddit Market Research: Competitor Threads

Searches Reddit for a buying question such as 'best CRM for small business' and returns the year's most relevant threads with their comments, so you can see which tools people recommend and why.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 posts and 97 comments in 15 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-competitor-research-search](https://datapika.com/tasks/reddit-scraper/reddit-competitor-research-search)
- Input file: [`reddit-scraper/reddit-competitor-research-search.json`](../../reddit-scraper/reddit-competitor-research-search.json)

## Input

The exact JSON input of the "Reddit Market Research: Competitor Threads" task. Change the values to make your own version.

```json
{
  "searches": [
    "best CRM for small business"
  ],
  "sort": "relevance",
  "time": "year",
  "includeComments": true,
  "maxCommentsPerPost": 30,
  "maxItems": 50
}
```

## Reddit Market Research: Competitor Threads with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "searches": [
    "best CRM for small business"
  ],
  "sort": "relevance",
  "time": "year",
  "includeComments": true,
  "maxCommentsPerPost": 30,
  "maxItems": 50
}
JSON
```

## Reddit Market Research: Competitor Threads with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "searches": ["best CRM for small business"],
    "sort": "relevance",
    "time": "year",
    "includeComments": True,
    "maxCommentsPerPost": 30,
    "maxItems": 50,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Reddit Market Research: Competitor Threads with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "searches": [
    "best CRM for small business"
  ],
  "sort": "relevance",
  "time": "year",
  "includeComments": true,
  "maxCommentsPerPost": 30,
  "maxItems": 50
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
| `createdAt` | Posted |
| `url` | Link |

## Questions

### Can it search inside comment text?

Reddit blocks keyword search of comments for logged-out visitors, so the task finds posts matching your keyword and returns their full comment threads.

### How many comments do I get per post?

Set maxCommentsPerPost. Small threads come back complete; very big threads return about 120 to 220 comments per post, the top of the tree first.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.
