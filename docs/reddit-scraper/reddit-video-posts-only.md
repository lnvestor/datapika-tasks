# Reddit Videos: Posts With Direct Video URLs

Collects posts from a subreddit and returns the video and image URLs Reddit serves for each, plus title, score and author. Use the links to archive or review clips.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 posts in 8 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-video-posts-only](https://datapika.com/tasks/reddit-scraper/reddit-video-posts-only)
- Input file: [`reddit-scraper/reddit-video-posts-only.json`](../../reddit-scraper/reddit-video-posts-only.json)

## Input

The exact JSON input of the "Reddit Videos: Posts With Direct Video URLs" task. Change the values to make your own version.

```json
{
  "subreddits": [
    "videos"
  ],
  "sort": "top",
  "time": "week",
  "maxItems": 100
}
```

## Reddit Videos: Posts With Direct Video URLs with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "subreddits": [
    "videos"
  ],
  "sort": "top",
  "time": "week",
  "maxItems": 100
}
JSON
```

## Reddit Videos: Posts With Direct Video URLs with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "subreddits": ["videos"],
    "sort": "top",
    "time": "week",
    "maxItems": 100,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Reddit Videos: Posts With Direct Video URLs with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "subreddits": [
    "videos"
  ],
  "sort": "top",
  "time": "week",
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
| `createdAt` | Posted |
| `url` | Link |

## Questions

### Does it download the video file?

It returns the direct media URLs for each post. Download them with any tool, or use the links in your own pipeline.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.
