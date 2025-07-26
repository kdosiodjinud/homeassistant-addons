import { test, expect } from '@playwright/test';

function randomFromArray(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

function getRandomSettings() {
  const userAgents = [
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0',
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',
    'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:123.0) Gecko/20100101 Firefox/123.0',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 13_5_2) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3 Safari/605.1.15',
    'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1',
    'Mozilla/5.0 (Linux; Android 13; SM-G998B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Mobile Safari/537.36',
    'Mozilla/5.0 (Linux; Android 12; Pixel 6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36',
    'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 12_6_9) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Safari/605.1.15',
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
    'Mozilla/5.0 (Windows NT 11.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36'
  ];

  const locales = [
    'en-US', 'en-GB', 'cs-CZ', 'sk-SK', 'de-DE',
    'fr-FR', 'es-ES', 'pl-PL', 'it-IT', 'nl-NL',
    'pt-PT', 'pt-BR', 'ru-RU', 'tr-TR', 'ja-JP'
  ];

  const timezones = [
    'Europe/Prague', 'Europe/Berlin', 'Europe/London', 'America/New_York', 'America/Los_Angeles',
    'Asia/Istanbul', 'Asia/Tokyo', 'Asia/Shanghai', 'Asia/Kolkata', 'Europe/Moscow',
    'Australia/Sydney', 'Africa/Johannesburg', 'America/Sao_Paulo', 'Europe/Paris', 'Asia/Dubai'
  ];

  const viewports = [
    { width: 1920, height: 1080 },
    { width: 1366, height: 768 },
    { width: 1536, height: 864 },
    { width: 1280, height: 800 },
    { width: 1440, height: 900 },
    { width: 1600, height: 900 },
    { width: 1280, height: 720 },
    { width: 1024, height: 768 },
    { width: 1680, height: 1050 },
    { width: 2560, height: 1440 },
    { width: 360, height: 740 },    // mobilní
    { width: 414, height: 896 },   // iPhone XR
    { width: 375, height: 812 }    // iPhone X
  ];

  const colorSchemes = ['light', 'dark'];

  return {
    userAgent: randomFromArray(userAgents),
    locale: randomFromArray(locales),
    timezoneId: randomFromArray(timezones),
    viewport: randomFromArray(viewports),
    colorScheme: randomFromArray(colorSchemes),
    extraHTTPHeaders: {
      'accept-language': randomFromArray(locales),
      dnt: '1',
      pragma: 'no-cache',
      'sec-fetch-dest': 'document',
      'sec-fetch-mode': 'navigate',
      'sec-fetch-site': 'none',
      'sec-fetch-user': '?1',
      'upgrade-insecure-requests': '1',
    },
  };
}

test.setTimeout(10000);

test('Dynamic stealth user + extract redirected flight + metadata JSON', async ({ browser }) => {
  const flightId = process.env.FLIGHT_ID;
  if (!flightId) {
    throw new Error('❌ Missing FLIGHT_ID. Use: FLIGHT_ID=QS1057 npm run test');
  }

  const stealthSettings = getRandomSettings();
  const context = await browser.newContext(stealthSettings);
  const page = await context.newPage();

  console.log('🕵️ Using stealth settings:', stealthSettings);

  // Step 1: Go to original flight URL
  const originalFlightUrl = `https://planefinder.net/flight/${flightId}`;
  await page.goto(originalFlightUrl, {
    waitUntil: 'domcontentloaded',
    timeout: 45000,
  });

  const finalUrl = page.url();
  const match = finalUrl.match(/\/flight\/number\/([^/]+)/);
  const flightCode = match ? match[1] : null;

  console.log('✈️ Redirected flight code:', flightCode);
  expect(flightCode).not.toBeNull();

  // Step 2: Open metadata API for this flight
  const metadataPage = await context.newPage();
  const metadataUrl = `https://planefinder.net/api/v3/aircraft/live/metadata/0/*/*/${flightCode}`;

  await metadataPage.goto(metadataUrl, {
    waitUntil: 'domcontentloaded',
    timeout: 45000,
  });

  // Simulate chaotic humanity
  await metadataPage.mouse.move(300, 300);
  await metadataPage.waitForTimeout(300 + Math.random() * 700);
  await metadataPage.mouse.wheel(0, 150);
  await metadataPage.waitForTimeout(500 + Math.random() * 800);
  await metadataPage.mouse.move(500, 150);
  await metadataPage.waitForTimeout(200 + Math.random() * 500);

  const raw = await metadataPage.locator('pre').textContent();
  const jsonData = JSON.parse(raw || '{}');

  console.log('📦 Extracted JSON:');
  console.dir(jsonData, { depth: null });

  expect(jsonData).toBeDefined();

  await context.close();
});
