# Instagram Fitness Micro Influencers With Emails

Searches Instagram for fitness creators (fitness, personal trainer) and keeps micro influencers with 5,000 to 100,000 followers. Each row has exact followers, engagement from recent posts, paid-partnership flags, bio links and the emails the creator published. Only creators with an email are kept and billed.

- Actor: [`openclawai/influencer-finder`](https://apify.com/openclawai/influencer-finder) on Apify, billed per result
- Tested: Nov 23, 2026, build 0.1.21: 5 creators in 55 s
- Task page with sample rows: [datapika.com/tasks/influencer-finder/instagram-fitness-micro-influencers](https://datapika.com/tasks/influencer-finder/instagram-fitness-micro-influencers)
- Input file: [`influencer-finder/instagram-fitness-micro-influencers.json`](../../influencer-finder/instagram-fitness-micro-influencers.json)

## Input

The exact JSON input of the "Instagram Fitness Micro Influencers With Emails" task. Change the values to make your own version.

```json
{
  "keywords": [
    "fitness",
    "personal trainer"
  ],
  "platforms": [
    "instagram"
  ],
  "minFollowers": 5000,
  "maxFollowers": 100000,
  "onlyWithEmail": true,
  "maxCreators": 25
}
```

## Instagram Fitness Micro Influencers With Emails with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~influencer-finder/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "keywords": [
    "fitness",
    "personal trainer"
  ],
  "platforms": [
    "instagram"
  ],
  "minFollowers": 5000,
  "maxFollowers": 100000,
  "onlyWithEmail": true,
  "maxCreators": 25
}
JSON
```

## Instagram Fitness Micro Influencers With Emails with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "keywords": ["fitness", "personal trainer"],
    "platforms": ["instagram"],
    "minFollowers": 5000,
    "maxFollowers": 100000,
    "onlyWithEmail": True,
    "maxCreators": 25,
}
run = client.actor("openclawai/influencer-finder").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Instagram Fitness Micro Influencers With Emails with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "keywords": [
    "fitness",
    "personal trainer"
  ],
  "platforms": [
    "instagram"
  ],
  "minFollowers": 5000,
  "maxFollowers": 100000,
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
| `name` | Name |
| `handle` | Handle |
| `platform` | Platform |
| `followers` | Followers |
| `engagement_rate_pct` | Engagement % |
| `email` | Email |
| `email_status` | Email status |
| `lead_score` | Score |
| `lead_grade` | Grade |
| `matched_keyword` | Keyword |
| `profile_url` | Profile |

## Questions

### What counts as a micro influencer here?

This task keeps creators with 5,000 to 100,000 followers. Change minFollowers and maxFollowers to set your own range, e.g. 1,000 to 10,000 for nano influencers.

### How is Instagram engagement measured?

From the creator's latest posts: likes and comments against their follower count. Paid-partnership posts are flagged, so you can see who already works with brands.

### Where do the emails come from?

Only emails the creator published: their bio, their link-in-bio page and their own website. Each email shows its source and a deliverability check. Nothing is guessed.

### Does it search Instagram by keyword or do I need handles?

By keyword. You can also paste handles in profiles to look up a list you already have.

### How much does it cost?

You pay per creator delivered to your dataset, after your filters. Filtered-out or blocked profiles are never charged. The current price is on the Pricing tab.

### Do I need a login, cookie or API key?

No. It reads public profile pages only, with no account, cookie or API key. Run it from the Apify Console, the API or an AI agent through MCP.
