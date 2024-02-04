import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';

dotenv.config();

const sequelize = new Sequelize({
  username: "onahbernardchizoba",
  password: "DhEbtkn39CwO",
  database: "p-square-db",
  host: "ep-round-moon-23141132.us-east-2.aws.neon.tech",
  dialect: "postgres",
  "dialectOptions": {
    "ssl": true
  }
});

export default async function dbConnection() {
  try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
    return true;
  } catch (error) {
    console.error('Unable to connect to the database:', error);
    return error;
  }
}
