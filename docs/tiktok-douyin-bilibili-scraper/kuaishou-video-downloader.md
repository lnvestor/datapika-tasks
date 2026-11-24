# Kuaishou Downloader: Download a Creator's Videos

Paste a Kuaishou creator link (v.kuaishou.com share links work) and get their latest videos with watermark-free file links, titles, plays, likes and comments.

- Actor: [`openclawai/tiktok-douyin-bilibili-scraper`](https://apify.com/openclawai/tiktok-douyin-bilibili-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 1.0.88: 2 videos in 7 s
- Task page with sample rows: [datapika.com/tasks/tiktok-douyin-bilibili-scraper/kuaishou-video-downloader](https://datapika.com/tasks/tiktok-douyin-bilibili-scraper/kuaishou-video-downloader)
- Input file: [`tiktok-douyin-bilibili-scraper/kuaishou-video-downloader.json`](../../tiktok-douyin-bilibili-scraper/kuaishou-video-downloader.json)

## Input

The exact JSON input of the "Kuaishou Downloader: Download a Creator's Videos" task. Change the values to make your own version.

```json
{
  "mode": "user_posts",
  "platform": "kuaishou",
  "urls": [
    "https://v.kuaishou.com/KcdKDwFp"
  ],
  "maxItems": 10,
  "downloadVideos": true
}
```

## Kuaishou Downloader: Download a Creator's Videos with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~tiktok-douyin-bilibili-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "mode": "user_posts",
  "platform": "kuaishou",
  "urls": [
    "https://v.kuaishou.com/KcdKDwFp"
  ],
  "maxItems": 10,
  "downloadVideos": true
}
JSON
```

## Kuaishou Downloader: Download a Creator's Videos with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "mode": "user_posts",
    "platform": "kuaishou",
    "urls": ["https://v.kuaishou.com/KcdKDwFp"],
    "maxItems": 10,
    "downloadVideos": True,
}
run = client.actor("openclawai/tiktok-douyin-bilibili-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Kuaishou Downloader: Download a Creator's Videos with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "mode": "user_posts",
  "platform": "kuaishou",
  "urls": [
    "https://v.kuaishou.com/KcdKDwFp"
  ],
  "maxItems": 10,
  "downloadVideos": true
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

### Is the video link watermark-free and permanent?

The video_url_nowm column is the platform's own player file without the watermark. These links expire after some hours, so download the files soon after the run.

### Can I download a single Kuaishou video?

Yes. Use the video_detail mode with the video's link.

### Do I need an account, cookie or API key?

No. It reads public data with no login, cookie or API key. Run it from the Apify Console, the API, or an AI agent through MCP.

### How much does it cost?

You pay per result delivered to your dataset. There is no start fee. The current prices are on the Pricing tab.
