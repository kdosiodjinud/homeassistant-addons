const express = require('express');
const { exec } = require('child_process');

const app = express();

app.get('/', (req, res) => {
  const flightId = req.query.flightId;
  if (!flightId) {
    return res.status(400).json({ error: 'Missing flightId parameter' });
  }

  exec(`FLIGHT_ID=${flightId} npm run --silent extract`, (error, stdout, stderr) => {
    if (error) {
      return res.status(500).json({ error: 'Execution failed', details: stderr.toString() });
    }
    try {
      const data = JSON.parse(stdout);
      res.json(data);
    } catch (e) {
      res.status(200).send(stdout);
    }
  });
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
