# TikTok and Douyin Creator Videos in One Run

Paste TikTok and Douyin profile links together and get every creator's latest videos in one dataset with the same columns: caption, plays, likes, comments, shares and date.

- Actor: [`openclawai/tiktok-douyin-bilibili-scraper`](https://apify.com/openclawai/tiktok-douyin-bilibili-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 1.0.88: 10 videos in 6 s
- Task page with sample rows: [datapika.com/tasks/tiktok-douyin-bilibili-scraper/tiktok-and-douyin-creator-videos](https://datapika.com/tasks/tiktok-douyin-bilibili-scraper/tiktok-and-douyin-creator-videos)
- Input file: [`tiktok-douyin-bilibili-scraper/tiktok-and-douyin-creator-videos.json`](../../tiktok-douyin-bilibili-scraper/tiktok-and-douyin-creator-videos.json)

## Input

The exact JSON input of the "TikTok and Douyin Creator Videos in One Run" task. Change the values to make your own version.

```json
{
  "mode": "user_posts",
  "urls": [
    "https://www.tiktok.com/@tiktok",
    "https://www.douyin.com/user/MS4wLjABAAAANXSltcLCzDGmdNFI2Q_QixVTr67NiYzjKOIP5s03CAE"
  ],
  "maxItems": 20
}
```

## TikTok and Douyin Creator Videos in One Run with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~tiktok-douyin-bilibili-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "mode": "user_posts",
  "urls": [
    "https://www.tiktok.com/@tiktok",
    "https://www.douyin.com/user/MS4wLjABAAAANXSltcLCzDGmdNFI2Q_QixVTr67NiYzjKOIP5s03CAE"
  ],
  "maxItems": 20
}
JSON
```

## TikTok and Douyin Creator Videos in One Run with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "mode": "user_posts",
    "urls": [
        "https://www.tiktok.com/@tiktok",
        "https://www.douyin.com/user/MS4wLjABAAAANXSltcLCzDGmdNFI2Q_QixVTr67NiYzjKOIP5s03CAE",
    ],
    "maxItems": 20,
}
run = client.actor("openclawai/tiktok-douyin-bilibili-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## TikTok and Douyin Creator Videos in One Run with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "mode": "user_posts",
  "urls": [
    "https://www.tiktok.com/@tiktok",
    "https://www.douyin.com/user/MS4wLjABAAAANXSltcLCzDGmdNFI2Q_QixVTr67NiYzjKOIP5s03CAE"
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

### Which platforms can I mix?

TikTok, Douyin, Bilibili and Kuaishou links can go in the same run; the platform is detected from each link.

### Do I need an account, cookie or API key?

No. It reads public data with no login, cookie or API key. Run it from the Apify Console, the API, or an AI agent through MCP.

### How much does it cost?

You pay per result delivered to your dataset. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, or read it through the Apify API.
