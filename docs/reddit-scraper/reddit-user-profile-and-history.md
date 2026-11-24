# Reddit User History: Profile, Posts and Comments

Give one or more usernames and get each profile (karma, account age) plus the user's recent posts and comments, with subreddit, score and date for each. Useful for research, moderation and checking an account before you trust it.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 posts and 6 search results in 11 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-user-profile-and-history](https://datapika.com/tasks/reddit-scraper/reddit-user-profile-and-history)
- Input file: [`reddit-scraper/reddit-user-profile-and-history.json`](../../reddit-scraper/reddit-user-profile-and-history.json)

## Input

The exact JSON input of the "Reddit User History: Profile, Posts and Comments" task. Change the values to make your own version.

```json
{
  "users": [
    "spez"
  ],
  "maxItems": 50
}
```

## Reddit User History: Profile, Posts and Comments with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "users": [
    "spez"
  ],
  "maxItems": 50
}
JSON
```

## Reddit User History: Profile, Posts and Comments with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "users": ["spez"],
    "maxItems": 50,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Reddit User History: Profile, Posts and Comments with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "users": [
    "spez"
  ],
  "maxItems": 50
};
const run = await client.actor("openclawai/reddit-scraper").call(input, { maxTotalChargeUsd: 1 });
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

## Output fields

| Field | Column |
|---|---|
| `title` | Title |
| `subreddit` | Subreddit |
| `author` | Author |
| `score` | Score |
| `upvoteRatio` | Upvote % |
| `numComments` | Comments |
| `flair` | Flair |
| `createdAt` | Posted |
| `url` | Link |

## Questions

### How far back does the history go?

As far as Reddit lists it for the profile, usually up to about 1,000 recent posts and comments. Set maxItems to cap the run.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, read it through the Apify API, or run the task from an AI agent through the Apify MCP server.
