# TikTok Scraper: Creator Videos With Views and Likes

Paste a TikTok profile link and get the creator's latest videos: caption, hashtags, music, plays, likes, comments, shares and publish date for each.

- Actor: [`openclawai/tiktok-douyin-bilibili-scraper`](https://apify.com/openclawai/tiktok-douyin-bilibili-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 1.0.88: 5 videos in 5 s
- Task page with sample rows: [datapika.com/tasks/tiktok-douyin-bilibili-scraper/tiktok-creator-posts](https://datapika.com/tasks/tiktok-douyin-bilibili-scraper/tiktok-creator-posts)
- Input file: [`tiktok-douyin-bilibili-scraper/tiktok-creator-posts.json`](../../tiktok-douyin-bilibili-scraper/tiktok-creator-posts.json)

## Input

The exact JSON input of the "TikTok Scraper: Creator Videos With Views and Likes" task. Change the values to make your own version.

```json
{
  "mode": "user_posts",
  "platform": "tiktok",
  "urls": [
    "https://www.tiktok.com/@khaby.lame"
  ],
  "maxItems": 20
}
```

## TikTok Scraper: Creator Videos With Views and Likes with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~tiktok-douyin-bilibili-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "mode": "user_posts",
  "platform": "tiktok",
  "urls": [
    "https://www.tiktok.com/@khaby.lame"
  ],
  "maxItems": 20
}
JSON
```

## TikTok Scraper: Creator Videos With Views and Likes with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "mode": "user_posts",
    "platform": "tiktok",
    "urls": ["https://www.tiktok.com/@khaby.lame"],
    "maxItems": 20,
}
run = client.actor("openclawai/tiktok-douyin-bilibili-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## TikTok Scraper: Creator Videos With Views and Likes with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "mode": "user_posts",
  "platform": "tiktok",
  "urls": [
    "https://www.tiktok.com/@khaby.lame"
  ],
  "maxItems": 20
};
const run = await client.actor("openclawai/tiktok-douyin-bilibili-scraper").call(input, { maxTotalChargeUsd: 1 });
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

## Output fields

| Field | Column |
|---|---|
| `platform` | Platform |
| `title` | Title |
| `author_name` | Author |
| `play_count` | Plays |
| `like_count` | Likes |
| `comment_count` | Comments |
| `created_at` | Posted |
| `url` | URL |

## Questions

### How many videos can I get?

Set maxItems. The run walks back through the creator's videos page by page until it reaches that number.

### Do I need an account, cookie or API key?

No. It reads public data with no login, cookie or API key. Run it from the Apify Console, the API, or an AI agent through MCP.

### How much does it cost?

You pay per result delivered to your dataset. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, or read it through the Apify API.
