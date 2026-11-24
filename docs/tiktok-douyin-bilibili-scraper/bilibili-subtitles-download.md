# Bilibili Subtitles Download: Video Captions

Paste a Bilibili video link or BV id and get its subtitles: the full caption text in one field, the subtitle language, and a link to the timed subtitle file with start and end times for every line.

- Actor: [`openclawai/tiktok-douyin-bilibili-scraper`](https://apify.com/openclawai/tiktok-douyin-bilibili-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 1.0.88: 1 subtitle track in 15 s
- Task page with sample rows: [datapika.com/tasks/tiktok-douyin-bilibili-scraper/bilibili-subtitles-download](https://datapika.com/tasks/tiktok-douyin-bilibili-scraper/bilibili-subtitles-download)
- Input file: [`tiktok-douyin-bilibili-scraper/bilibili-subtitles-download.json`](../../tiktok-douyin-bilibili-scraper/bilibili-subtitles-download.json)

## Input

The exact JSON input of the "Bilibili Subtitles Download: Video Captions" task. Change the values to make your own version.

```json
{
  "mode": "subtitles",
  "platform": "bilibili",
  "urls": [
    "BV1rpWjevEip"
  ]
}
```

## Bilibili Subtitles Download: Video Captions with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~tiktok-douyin-bilibili-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "mode": "subtitles",
  "platform": "bilibili",
  "urls": [
    "BV1rpWjevEip"
  ]
}
JSON
```

## Bilibili Subtitles Download: Video Captions with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "mode": "subtitles",
    "platform": "bilibili",
    "urls": ["BV1rpWjevEip"],
}
run = client.actor("openclawai/tiktok-douyin-bilibili-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Bilibili Subtitles Download: Video Captions with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "mode": "subtitles",
  "platform": "bilibili",
  "urls": [
    "BV1rpWjevEip"
  ]
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
| `url` | Url |
| `title` | Title |
| `description` | Description |

## Questions

### What if a video has no subtitles?

Many Bilibili videos have none. The run then returns no rows for that video and nothing is charged for it.

### Do I need an account, cookie or API key?

No. It reads public data with no login, cookie or API key. Run it from the Apify Console, the API, or an AI agent through MCP.

### How much does it cost?

You pay per result delivered to your dataset. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, or read it through the Apify API.
