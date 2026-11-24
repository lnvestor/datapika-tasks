# Download a Reddit Dataset as JSON or CSV

Downloads the year's top posts of a subreddit as a ready dataset with consistent columns (id, title, body, author, score, upvote ratio, comments, flair, media, date). Change the subreddit for any topic.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 posts in 12 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-dataset-json-csv](https://datapika.com/tasks/reddit-scraper/reddit-dataset-json-csv)
- Input file: [`reddit-scraper/reddit-dataset-json-csv.json`](../../reddit-scraper/reddit-dataset-json-csv.json)

## Input

The exact JSON input of the "Download a Reddit Dataset as JSON or CSV" task. Change the values to make your own version.

```json
{
  "subreddits": [
    "datasets"
  ],
  "sort": "top",
  "time": "year",
  "maxItems": 200
}
```

## Download a Reddit Dataset as JSON or CSV with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "subreddits": [
    "datasets"
  ],
  "sort": "top",
  "time": "year",
  "maxItems": 200
}
JSON
```

## Download a Reddit Dataset as JSON or CSV with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "subreddits": ["datasets"],
    "sort": "top",
    "time": "year",
    "maxItems": 200,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Download a Reddit Dataset as JSON or CSV with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "subreddits": [
    "datasets"
  ],
  "sort": "top",
  "time": "year",
  "maxItems": 200
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

### How do I export the results?

Download the dataset as JSON, CSV or Excel, read it through the Apify API, or run the task from an AI agent through the Apify MCP server.

### Can I include comments in the dataset?

Yes. Turn on includeComments and set maxCommentsPerPost.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.
