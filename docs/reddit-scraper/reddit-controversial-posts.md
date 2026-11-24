# Reddit Controversial Posts of the Month

Sorts a subreddit by controversial with a time filter and returns the most divisive posts with score, upvote ratio and comment count. Useful for sentiment research and spotting heated topics.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 posts in 7 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-controversial-posts](https://datapika.com/tasks/reddit-scraper/reddit-controversial-posts)
- Input file: [`reddit-scraper/reddit-controversial-posts.json`](../../reddit-scraper/reddit-controversial-posts.json)

## Input

The exact JSON input of the "Reddit Controversial Posts of the Month" task. Change the values to make your own version.

```json
{
  "subreddits": [
    "technology"
  ],
  "sort": "controversial",
  "time": "month",
  "maxItems": 100
}
```

## Reddit Controversial Posts of the Month with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "subreddits": [
    "technology"
  ],
  "sort": "controversial",
  "time": "month",
  "maxItems": 100
}
JSON
```

## Reddit Controversial Posts of the Month with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "subreddits": ["technology"],
    "sort": "controversial",
    "time": "month",
    "maxItems": 100,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Reddit Controversial Posts of the Month with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "subreddits": [
    "technology"
  ],
  "sort": "controversial",
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

### What makes a post controversial?

Reddit's own controversial sort: posts with many votes on both sides. The upvote ratio column shows how split the votes are.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.
