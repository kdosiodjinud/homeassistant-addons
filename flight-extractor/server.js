const express = require('express');
const { exec } = require('child_process');

const app = express();

app.get('/', (req, res) => {
  const flightId = req.query.flightId;
  if (!flightId) {
    return res.status(400).json({ error: 'Missing flightId parameter' });
  }

  const command = `FLIGHT_ID=${flightId} npm run extract`;
  console.log('🔧 Running command:', command);

  exec(command, { env: process.env }, (error, stdout, stderr) => {
    if (stdout) console.log('[extract stdout]:', stdout.trim());
    if (stderr) console.error('[extract stderr]:', stderr.trim());

    if (error) {
      return res.status(500).json({
        error: 'Execution failed',
        details: stderr.toString() || error.toString()
      });
    }

    // Try to find JSON in stdout (last line of output usually)
    const lines = stdout.trim().split('\n');
    const lastLine = lines[lines.length - 1];

    try {
      const parsed = JSON.parse(lastLine);
      return res.json(parsed);
    } catch (e) {
      // fallback – return whole output
      return res.status(200).send(stdout);
    }
  });
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`🚀 Server listening on port ${port}`);
});
