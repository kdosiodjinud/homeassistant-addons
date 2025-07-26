# Flight Extractor Add-on

This add-on exposes an HTTP API that accepts a `flightId` query parameter and runs a mocked extraction script. The result of the script is returned as JSON.

Example request:
```
GET http://<addon_host>:3000/?flightId=KLM897
```
