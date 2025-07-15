const express = require('express');
const client = require('prom-client');

const app = express();
const register = new client.Registry();

client.collectDefaultMetrics({ register });

app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>System Resource Monitor</title>
      <style>
        body {
          font-family: 'Segoe UI', sans-serif;
          background-color: #0f172a;
          color: #f8fafc;
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
          margin: 0;
        }
        .card {
          background-color: #1e293b;
          padding: 2rem 3rem;
          border-radius: 1rem;
          box-shadow: 0 0 30px rgba(0,0,0,0.3);
          text-align: center;
        }
        h1 {
          margin-bottom: 1rem;
          color: #38bdf8;
        }
        p {
          font-size: 1.1rem;
          color: #cbd5e1;
        }
        .status {
          margin-top: 1.5rem;
          padding: 0.5rem 1rem;
          background-color: #22c55e;
          display: inline-block;
          border-radius: 0.5rem;
          font-weight: bold;
          color: #0f172a;
        }
      </style>
    </head>
    <body>
      <div class="card">
        <h1>System Resource Monitor</h1>
        <p>Your full-stack monitoring app is running and ready to track server metrics in real-time.</p>
        <div class="status">✅ Service is LIVE</div>
      </div>
    </body>
    </html>
  `);
});

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

app.listen(3000, () => {
  console.log('App running on port 3000');
});
