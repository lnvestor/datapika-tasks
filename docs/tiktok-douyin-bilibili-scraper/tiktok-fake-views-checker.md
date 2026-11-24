# TikTok Fake Views Checker

Paste a TikTok video id or link and get a report on whether its views look bought or inflated, based on the video's view and engagement patterns. Useful before paying an influencer.

- Actor: [`openclawai/tiktok-douyin-bilibili-scraper`](https://apify.com/openclawai/tiktok-douyin-bilibili-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 1.0.88: 1 view report in 13 s
- Task page with sample rows: [datapika.com/tasks/tiktok-douyin-bilibili-scraper/tiktok-fake-views-checker](https://datapika.com/tasks/tiktok-douyin-bilibili-scraper/tiktok-fake-views-checker)
- Input file: [`tiktok-douyin-bilibili-scraper/tiktok-fake-views-checker.json`](../../tiktok-douyin-bilibili-scraper/tiktok-fake-views-checker.json)

## Input

The exact JSON input of the "TikTok Fake Views Checker" task. Change the values to make your own version.

```json
{
  "mode": "fake_view_check",
  "platform": "tiktok",
  "urls": [
    "7460937381265411370"
  ]
}
```

## TikTok Fake Views Checker with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~tiktok-douyin-bilibili-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "mode": "fake_view_check",
  "platform": "tiktok",
  "urls": [
    "7460937381265411370"
  ]
}
JSON
```

## TikTok Fake Views Checker with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "mode": "fake_view_check",
    "platform": "tiktok",
    "urls": ["7460937381265411370"],
}
run = client.actor("openclawai/tiktok-douyin-bilibili-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## TikTok Fake Views Checker with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "mode": "fake_view_check",
  "platform": "tiktok",
  "urls": [
    "7460937381265411370"
  ]
};
const run = await client.actor("openclawai/tiktok-douyin-bilibili-scraper").call(input, { maxTotalChargeUsd: 1 });
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

## Output fields

| Field | Column |
|---|---|
| `video` | Video |
| `total_views` | Total views |
| `fake_view_percentage` | Fake view percentage |
| `estimated_fake_views` | Estimated fake views |
| `is_suspicious` | Is suspicious |
| `fake_score` | Fake score |
| `confidence` | Confidence |
| `creator_trust_score` | Creator trust score |
| `creator_followers` | Creator followers |

## Questions

### Is the result proof of fake views?

No. It is a risk signal from view and engagement patterns. Use it with other checks before you decide.

### Do I need an account, cookie or API key?

No. It reads public data with no login, cookie or API key. Run it from the Apify Console, the API, or an AI agent through MCP.

### How much does it cost?

You pay per result delivered to your dataset. There is no start fee. The current prices are on the Pricing tab.
