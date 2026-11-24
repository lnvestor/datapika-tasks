# Douyin Trending Videos Today

Returns the videos trending on Douyin right now, with caption, author, plays, likes, comments, shares and link, so you can follow what is popular in China.

- Actor: [`openclawai/tiktok-douyin-bilibili-scraper`](https://apify.com/openclawai/tiktok-douyin-bilibili-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 1.0.88: 5 videos in 2 s
- Task page with sample rows: [datapika.com/tasks/tiktok-douyin-bilibili-scraper/douyin-trending-videos](https://datapika.com/tasks/tiktok-douyin-bilibili-scraper/douyin-trending-videos)
- Input file: [`tiktok-douyin-bilibili-scraper/douyin-trending-videos.json`](../../tiktok-douyin-bilibili-scraper/douyin-trending-videos.json)

## Input

The exact JSON input of the "Douyin Trending Videos Today" task. Change the values to make your own version.

```json
{
  "mode": "trending",
  "platform": "douyin",
  "maxItems": 20
}
```

## Douyin Trending Videos Today with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~tiktok-douyin-bilibili-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "mode": "trending",
  "platform": "douyin",
  "maxItems": 20
}
JSON
```

## Douyin Trending Videos Today with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "mode": "trending",
    "platform": "douyin",
    "maxItems": 20,
}
run = client.actor("openclawai/tiktok-douyin-bilibili-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Douyin Trending Videos Today with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "mode": "trending",
  "platform": "douyin",
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
| `item_id` | Item id |
| `title` | Title |
| `description` | Description |
| `play_count` | Play count |

## Questions

### Can I schedule it?

Yes. Save the task and add a schedule in Apify to collect the trending list every day.

### Do I need an account, cookie or API key?

No. It reads public data with no login, cookie or API key. Run it from the Apify Console, the API, or an AI agent through MCP.

### How much does it cost?

You pay per result delivered to your dataset. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, or read it through the Apify API.
