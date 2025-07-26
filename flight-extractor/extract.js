const flightId = process.env.FLIGHT_ID || 'UNKNOWN';
const result = { flightId, result: 'Mocked extract data' };
console.log(JSON.stringify(result));
