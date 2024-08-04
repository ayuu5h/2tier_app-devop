const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const { Pool } = require('pg');

const pool = new Pool({
  host: 'backend', // Docker service name
  user: 'admin',
  password: 'password',
  database: 'mydb',
  port: 5432,
});

app.use(bodyParser.json());

app.post('/add', async (req, res) => {
  const { name } = req.body;
  const result = await pool.query('INSERT INTO users(name) VALUES($1) RETURNING *', [name]);
  res.json(result.rows[0]);
});

app.listen(80, () => {
  console.log('Frontend running on port 80');
}); 
