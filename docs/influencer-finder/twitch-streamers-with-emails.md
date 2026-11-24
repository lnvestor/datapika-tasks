# Twitch Streamers With Emails by Game or Topic

Searches Twitch for streamers by game or topic (Minecraft, Fortnite) and reads each channel: followers, the game they last streamed, panel and bio links and the business emails streamers published. Only streamers with an email are kept and billed.

- Actor: [`openclawai/influencer-finder`](https://apify.com/openclawai/influencer-finder) on Apify, billed per result
- Tested: Nov 23, 2026, build 0.1.21: 5 creators in 2 s
- Task page with sample rows: [datapika.com/tasks/influencer-finder/twitch-streamers-with-emails](https://datapika.com/tasks/influencer-finder/twitch-streamers-with-emails)
- Input file: [`influencer-finder/twitch-streamers-with-emails.json`](../../influencer-finder/twitch-streamers-with-emails.json)

## Input

The exact JSON input of the "Twitch Streamers With Emails by Game or Topic" task. Change the values to make your own version.

```json
{
  "keywords": [
    "minecraft",
    "fortnite"
  ],
  "platforms": [
    "twitch"
  ],
  "onlyWithEmail": true,
  "maxCreators": 25
}
```

## Twitch Streamers With Emails by Game or Topic with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~influencer-finder/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "keywords": [
    "minecraft",
    "fortnite"
  ],
  "platforms": [
    "twitch"
  ],
  "onlyWithEmail": true,
  "maxCreators": 25
}
JSON
```

## Twitch Streamers With Emails by Game or Topic with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "keywords": ["minecraft", "fortnite"],
    "platforms": ["twitch"],
    "onlyWithEmail": True,
    "maxCreators": 25,
}
run = client.actor("openclawai/influencer-finder").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Twitch Streamers With Emails by Game or Topic with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "keywords": [
    "minecraft",
    "fortnite"
  ],
  "platforms": [
    "twitch"
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
| `view_rate_pct` | View rate % |
| `email` | Email |
| `email_status` | Email status |
| `lead_score` | Score |
| `lead_grade` | Grade |
| `matched_keyword` | Keyword |
| `profile_url` | Profile |

## Questions

### Where do Twitch emails come from?

From the streamer's bio, panels, link-in-bio page and website: only addresses they published for business contact.

### Can I change the niche or the number of creators?

Yes. Edit the keywords to any topic and set maxCreators up to 5,000. Use any game name or topic, e.g. 'valorant' or 'just chatting'.

### How much does it cost?

You pay per creator delivered to your dataset, after your filters. Filtered-out or blocked profiles are never charged. The current price is on the Pricing tab.

### Do I need a login, cookie or API key?

No. It reads public profile pages only, with no account, cookie or API key. Run it from the Apify Console, the API or an AI agent through MCP.

### Can I add TikTok and YouTube gaming creators?

Yes. Add 'tiktok' and 'youtube' to platforms to get one list across all three.
