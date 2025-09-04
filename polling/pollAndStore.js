const fs = require("fs");
const sqlite3 = require("sqlite3").verbose();

const API_URL = "https://jsonplaceholder.typicode.com/posts/1";
const FILE_PATH = "response.txt";
const POLL_INTERVAL_MS = 10000; // 10 seconds

const db = new sqlite3.Database("./data.db", (err) => {
  if (err) return console.error("DB connect error:", err.message);
  console.log("Connected to SQLite database");
});

db.run(`CREATE TABLE IF NOT EXISTS ApiResponses(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  response TEXT,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
)`);

async function pollApiAndStore() {
  try {
    const response = await fetch(API_URL);
    if (!response.ok) throw new Error(`HTTP error: ${response.status}`);

    const data = await response.json();
    const dataString = JSON.stringify(data, null, 2);

    fs.writeFileSync(FILE_PATH, dataString, "utf-8");
    console.log("Response saved to file:", FILE_PATH);

    db.run(
      `INSERT INTO ApiResponses(response) VALUES(?)`,
      [dataString],
      function (err) {
        if (err) {
          return console.error("DB insert error:", err.message);
        }
        console.log("Data saved to DB with rowid:", this.lastID);
      }
    );
  } catch (error) {
    console.error("Error polling API or saving data:", error);
  }
}

setInterval(pollApiAndStore, POLL_INTERVAL_MS);

// Optional to run the first poll immediately
pollApiAndStore();
