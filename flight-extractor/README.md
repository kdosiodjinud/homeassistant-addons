# Flight Extractor Add-on

This add-on exposes an HTTP API that accepts a `flightId` query parameter and runs
a Playwright based extraction script. The result of the script is returned as JSON.

The extraction logic can also be executed manually:

```bash
FLIGHT_ID=KLM897 npm run extract
```

Which produces the same JSON that would be returned from the HTTP endpoint.

Example request:
```
GET http://<addon_host>:3000/?flightId=KLM897
```
