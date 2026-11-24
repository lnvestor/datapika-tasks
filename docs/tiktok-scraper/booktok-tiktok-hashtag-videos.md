# BookTok Videos: TikTok #booktok Data Export

Collects TikTok videos tagged #booktok with caption, author, plays, likes, comments, shares and date, so publishers and authors can find the book creators and videos driving sales.

- Actor: [`openclawai/tiktok-scraper`](https://apify.com/openclawai/tiktok-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 1.0.19: 5 videos in 7 s
- Task page with sample rows: [datapika.com/tasks/tiktok-douyin-bilibili-scraper/booktok-tiktok-hashtag-videos](https://datapika.com/tasks/tiktok-douyin-bilibili-scraper/booktok-tiktok-hashtag-videos)
- Input file: [`tiktok-scraper/booktok-tiktok-hashtag-videos.json`](../../tiktok-scraper/booktok-tiktok-hashtag-videos.json)

## Input

The exact JSON input of the "BookTok Videos: TikTok #booktok Data Export" task. Change the values to make your own version.

```json
{
  "mode": "hashtag_videos",
  "urls": [
    "#booktok"
  ],
  "maxItems": 200
}
```

## BookTok Videos: TikTok #booktok Data Export with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~tiktok-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "mode": "hashtag_videos",
  "urls": [
    "#booktok"
  ],
  "maxItems": 200
}
JSON
```

## BookTok Videos: TikTok #booktok Data Export with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "mode": "hashtag_videos",
    "urls": ["#booktok"],
    "maxItems": 200,
}
run = client.actor("openclawai/tiktok-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## BookTok Videos: TikTok #booktok Data Export with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "mode": "hashtag_videos",
  "urls": [
    "#booktok"
  ],
  "maxItems": 200
};
const run = await client.actor("openclawai/tiktok-scraper").call(input, { maxTotalChargeUsd: 1 });
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

### Can I use another hashtag?

Yes. Replace #booktok with any hashtag, e.g. #bookrecommendations or #romancebooks.

### Do I need an account, cookie or API key?

No. It reads public data with no login, cookie or API key. Run it from the Apify Console, the API, or an AI agent through MCP.

### How much does it cost?

You pay per result delivered to your dataset. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, or read it through the Apify API.
