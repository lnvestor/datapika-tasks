# Best of Reddit: Top Posts of All Time

Returns Reddit's most upvoted posts of all time from r/all with score, comment count, subreddit, author and media links. Change the subreddit to get the best of any community.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 posts in 5 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/best-of-reddit-top-posts-all-time](https://datapika.com/tasks/reddit-scraper/best-of-reddit-top-posts-all-time)
- Input file: [`reddit-scraper/best-of-reddit-top-posts-all-time.json`](../../reddit-scraper/best-of-reddit-top-posts-all-time.json)

## Input

The exact JSON input of the "Best of Reddit: Top Posts of All Time" task. Change the values to make your own version.

```json
{
  "subreddits": [
    "all"
  ],
  "sort": "top",
  "time": "all",
  "maxItems": 100
}
```

## Best of Reddit: Top Posts of All Time with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "subreddits": [
    "all"
  ],
  "sort": "top",
  "time": "all",
  "maxItems": 100
}
JSON
```

## Best of Reddit: Top Posts of All Time with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "subreddits": ["all"],
    "sort": "top",
    "time": "all",
    "maxItems": 100,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Best of Reddit: Top Posts of All Time with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "subreddits": [
    "all"
  ],
  "sort": "top",
  "time": "all",
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

### Can I get the best posts of one subreddit?

Yes. Replace all with any subreddit name, and set time to year, month or week if you want a shorter period.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, read it through the Apify API, or run the task from an AI agent through the Apify MCP server.
