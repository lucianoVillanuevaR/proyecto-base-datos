import { dirname } from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';
import pkg from 'pg';

const __dirname = dirname(fileURLToPath(import.meta.url));
dotenv.config({ path: __dirname + '/.env' });

console.log('DB_PASSWORD cargada:', process.env.DB_PASSWORD);

const { Pool } = pkg;

const password = process.env.DB_PASSWORD;
if (!password || typeof password !== 'string') {
  throw new Error(' La contraseña no está definida o no es texto. Revisa tu archivo .env');
}

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password,
  port: parseInt(process.env.DB_PORT)
});

export default pool;
