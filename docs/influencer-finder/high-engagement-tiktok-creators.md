# High-Engagement TikTok Creators (5%+)

Searches TikTok for cooking creators and keeps only those whose engagement rate from recent videos is 5% or higher, so big but inactive audiences are left out. Each row has followers, engagement, median views, sponsored posts and the emails the creator published.

- Actor: [`openclawai/influencer-finder`](https://apify.com/openclawai/influencer-finder) on Apify, billed per result
- Tested: Nov 23, 2026, build 0.1.21: 5 creators in 14 s
- Task page with sample rows: [datapika.com/tasks/influencer-finder/high-engagement-tiktok-creators](https://datapika.com/tasks/influencer-finder/high-engagement-tiktok-creators)
- Input file: [`influencer-finder/high-engagement-tiktok-creators.json`](../../influencer-finder/high-engagement-tiktok-creators.json)

## Input

The exact JSON input of the "High-Engagement TikTok Creators (5%+)" task. Change the values to make your own version.

```json
{
  "keywords": [
    "cooking",
    "recipes"
  ],
  "platforms": [
    "tiktok"
  ],
  "minEngagementRate": "5",
  "onlyWithEmail": true,
  "maxCreators": 25
}
```

## High-Engagement TikTok Creators (5%+) with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~influencer-finder/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "keywords": [
    "cooking",
    "recipes"
  ],
  "platforms": [
    "tiktok"
  ],
  "minEngagementRate": "5",
  "onlyWithEmail": true,
  "maxCreators": 25
}
JSON
```

## High-Engagement TikTok Creators (5%+) with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "keywords": ["cooking", "recipes"],
    "platforms": ["tiktok"],
    "minEngagementRate": "5",
    "onlyWithEmail": True,
    "maxCreators": 25,
}
run = client.actor("openclawai/influencer-finder").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## High-Engagement TikTok Creators (5%+) with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "keywords": [
    "cooking",
    "recipes"
  ],
  "platforms": [
    "tiktok"
  ],
  "minEngagementRate": "5",
  "onlyWithEmail": true,
  "maxCreators": 25
};
const run = await client.actor("openclawai/influencer-finder").call(input, { maxTotalChargeUsd: 1 });
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

## Output fields

| Field | Column |
|---|---|
| `handle` | Handle |
| `platform` | Platform |
| `followers` | Followers |
| `audience_size` | Tier |
| `avg_views` | Avg views |
| `median_views` | Median views |
| `view_rate_pct` | View rate % |
| `avg_likes_per_post` | Avg likes |
| `engagement_rate_pct` | Engagement % |
| `posts_per_week` | Posts/week |
| `last_post_at` | Last post |
| `sponsored_posts` | Sponsored posts |
| `brands_mentioned` | Brands |
| `posts_sampled` | Posts sampled |
| `follower_growth_6m_pct` | Growth 6 mo % |

## Questions

### How is TikTok engagement measured?

From the creator's most recent videos: likes, comments and views per video against their follower count. You also get the median views and the date of their last post.

### Can I change the engagement threshold?

Yes. Set minEngagementRate to any number, e.g. 3 for 3%. Creators without a measurable rate are skipped when it is set.

### Where do the emails come from?

Only emails the creator published: their bio, their link-in-bio page and their own website. Each email shows its source and a deliverability check. Nothing is guessed.

### How much does it cost?

You pay per creator delivered to your dataset, after your filters. Filtered-out or blocked profiles are never charged. The current price is on the Pricing tab.

### Do I need a login, cookie or API key?

No. It reads public profile pages only, with no account, cookie or API key. Run it from the Apify Console, the API or an AI agent through MCP.
