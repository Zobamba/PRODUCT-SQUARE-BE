import express from 'express';
import routes from './routes/routes.js';
import bodyParser from 'body-parser';
import dbConnection from './utils/database.js';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();
 
const app = express();

const corsOptions = {
  origin: ['http://localhost:3000'],
  credentials: true,
};

app.use(cors(corsOptions));

app.use(bodyParser.urlencoded({ extended: true, limit: '50mb' }));
app.use(bodyParser.json({ limit: '50mb' }));

app.use(express.json());

const PORT = 4000;

// Homepage route
app.get('/', (req, res) => {
  res.send('Welcome to Product Square');
});

routes(app);

dbConnection();

app.listen(PORT, console.log(`Index app listening on http://localhost:${PORT}`))