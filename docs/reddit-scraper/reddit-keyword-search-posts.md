# Reddit Search Tool: Posts by Keyword, No API Key

Runs a keyword search across all of Reddit and returns matching posts with title, body, subreddit, author, score, comment count and date. Sort by relevance, hot, top, new or comments and filter by hour, day, week, month, year or all time.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 posts in 72 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-keyword-search-posts](https://datapika.com/tasks/reddit-scraper/reddit-keyword-search-posts)
- Input file: [`reddit-scraper/reddit-keyword-search-posts.json`](../../reddit-scraper/reddit-keyword-search-posts.json)

## Input

The exact JSON input of the "Reddit Search Tool: Posts by Keyword, No API Key" task. Change the values to make your own version.

```json
{
  "searches": [
    "claude code"
  ],
  "sort": "relevance",
  "time": "month",
  "maxItems": 100
}
```

## Reddit Search Tool: Posts by Keyword, No API Key with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "searches": [
    "claude code"
  ],
  "sort": "relevance",
  "time": "month",
  "maxItems": 100
}
JSON
```

## Reddit Search Tool: Posts by Keyword, No API Key with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "searches": ["claude code"],
    "sort": "relevance",
    "time": "month",
    "maxItems": 100,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Reddit Search Tool: Posts by Keyword, No API Key with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "searches": [
    "claude code"
  ],
  "sort": "relevance",
  "time": "month",
  "maxItems": 100
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

### Can it search inside comment text?

Reddit blocks keyword search of comments for logged-out visitors, so the task finds posts matching your keyword and returns their full comment threads.

### Can I search several keywords at once?

Yes. Add more entries to searches; posts found by more than one keyword are delivered once.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.
