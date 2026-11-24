# Reddit User Lookup: Karma and Account Age

Looks up Reddit users matching a name and returns total karma, account creation date and profile URL for each, so you can check account age and reputation in bulk.

- Actor: [`openclawai/reddit-scraper`](https://apify.com/openclawai/reddit-scraper) on Apify, billed per result
- Tested: Nov 23, 2026, build 2.1.28: 5 search results in 16 s
- Task page with sample rows: [datapika.com/tasks/reddit-scraper/reddit-user-lookup-karma](https://datapika.com/tasks/reddit-scraper/reddit-user-lookup-karma)
- Input file: [`reddit-scraper/reddit-user-lookup-karma.json`](../../reddit-scraper/reddit-user-lookup-karma.json)

## Input

The exact JSON input of the "Reddit User Lookup: Karma and Account Age" task. Change the values to make your own version.

```json
{
  "searches": [
    "spez"
  ],
  "searchType": "users",
  "maxItems": 10
}
```

## Reddit User Lookup: Karma and Account Age with curl

Runs the task and returns the rows as a JSON array in one request. `maxTotalChargeUsd=1` stops the run once it has cost $1. Needs an Apify API token in `APIFY_TOKEN`.

```bash
curl -s -X POST "https://api.apify.com/v2/acts/openclawai~reddit-scraper/run-sync-get-dataset-items?maxTotalChargeUsd=1" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  --data @- <<'JSON'
{
  "searches": [
    "spez"
  ],
  "searchType": "users",
  "maxItems": 10
}
JSON
```

## Reddit User Lookup: Karma and Account Age with Python

Uses the official Apify client (`pip install apify-client`). `max_total_charge_usd` caps the cost of the run.

```python
import os
from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])
run_input = {
    "searches": ["spez"],
    "searchType": "users",
    "maxItems": 10,
}
run = client.actor("openclawai/reddit-scraper").call(run_input=run_input, max_total_charge_usd=1)
dataset_id = run["defaultDatasetId"] if isinstance(run, dict) else run.default_dataset_id
for row in client.dataset(dataset_id).iterate_items():
    print(row)
```

## Reddit User Lookup: Karma and Account Age with JavaScript

Uses the official Apify client for Node.js (`npm install apify-client`), as an ES module. `maxTotalChargeUsd` caps the cost of the run.

```js
import { ApifyClient } from "apify-client";

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const input = {
  "searches": [
    "spez"
  ],
  "searchType": "users",
  "maxItems": 10
};
const run = await client.actor("openclawai/reddit-scraper").call(input, { maxTotalChargeUsd: 1 });
const { items } = await client.dataset(run.defaultDatasetId).listItems();
console.log(items);
```

## Output fields

| Field | Column |
|---|---|
| `username` | Username |
| `url` | Url |
| `displayName` | Display name |
| `description` | Description |
| `postKarma` | Post karma |
| `commentKarma` | Comment karma |
| `totalKarma` | Total karma |
| `isVerified` | Is verified |
| `isGold` | Is gold |

## Questions

### Can I look up many users at once?

Yes. Add several names to searches, or list exact usernames in users to get their full profiles and history.

### Do I need a Reddit account or API key?

No. It reads public Reddit data anonymously, with no login, cookie, app registration or API key.

### How much does it cost?

You pay per result delivered to your dataset: posts, comments, users or communities. There is no start fee. The current prices are on the Pricing tab.

### How do I export the results?

Download the dataset as JSON, CSV or Excel, read it through the Apify API, or run the task from an AI agent through the Apify MCP server.
