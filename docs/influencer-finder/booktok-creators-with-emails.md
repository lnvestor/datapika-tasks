# BookTok Creators on TikTok With Emails

Searches TikTok for BookTok creators by keyword (booktok, book recommendations), then reads each profile: exact followers, engagement and median views from recent videos, sponsored posts, bio links and the emails the creator published. Only creators with an email are kept and billed.

- Actor: [`openclawai/influencer-finder`](https://apify.com/openclawai/influencer-finder) on Apify, billed per result
- Tested: Nov 23, 2026, build 0.1.21: 5 creators in 18 s
- Task page with sample rows: [datapika.com/tasks/influencer-finder/booktok-creators-with-emails](https://datapika.com/tasks/influencer-finder/booktok-creators-with-emails)
- Input file: [`influencer-finder/booktok-creators-with-emails.json`](../../influencer-finder/booktok-creators-with-emails.json)

## Input

The exact JSON input of the "BookTok Creators on TikTok With Emails" task. Change the values to make your own version.

```json
{
  "keywords": [
    "booktok",
    "book recommendations"
  ],
  "platforms": [
    "tiktok"
  ],
  "onlyWithEmail": true,
  "maxCreators": 25
}
```

## BookTok Creators on TikTok With Emails with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~influencer-finder/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "keywords": [
    "booktok",
    "book recommendations"
  ],
  "platforms": [
    "tiktok"
  ],
  "onlyWithEmail": true,
  "maxCreators": 25
}
JSON
```

## BookTok Creators on TikTok With Emails with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "keywords": ["booktok", "book recommendations"],
    "platforms": ["tiktok"],
    "onlyWithEmail": True,
    "maxCreators": 25,
}
run = client.actor("openclawai/influencer-finder").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## BookTok Creators on TikTok With Emails with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "keywords": [
    "booktok",
    "book recommendations"
  ],
  "platforms": [
    "tiktok"
  ],
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
| `view_rate_pct` | View rate % |
| `email` | Email |
| `email_status` | Email status |
| `lead_score` | Score |
| `lead_grade` | Grade |
| `matched_keyword` | Keyword |
| `profile_url` | Profile |

## Questions

### How is TikTok engagement measured?

From the creator's most recent videos: likes, comments and views per video against their follower count. You also get the median views and the date of their last post.

### Where do the emails come from?

Only emails the creator published: their bio, their link-in-bio page and their own website. Each email shows its source and a deliverability check. Nothing is guessed.

### Can I change the niche or the number of creators?

Yes. Edit the keywords to any topic and set maxCreators up to 5,000. Add Instagram or YouTube to platforms to search them in the same run.

### Is this useful for book launches?

Yes. Publishers and authors use it to build a BookTok outreach list: creator, audience size, engagement and a published email for review copies.

### How much does it cost?

You pay per creator delivered to your dataset, after your filters. Filtered-out or blocked profiles are never charged. The current price is on the Pricing tab.

### Do I need a login, cookie or API key?

No. It reads public profile pages only, with no account, cookie or API key. Run it from the Apify Console, the API or an AI agent through MCP.
