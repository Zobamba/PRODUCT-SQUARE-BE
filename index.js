import express from 'express';
import routes from './routes/routes';
import bodyParser from 'body-parser';
 
const app = express();

app.use(express.json());

app.use(bodyParser.urlencoded({ extended: true, limit: '50mb' }));
app.use(bodyParser.json({ limit: '50mb' }));

const PORT = 4000;

// Homepage route
app.get('/', (req, res) => {
  res.send('Welcome to Product Square');
});

routes(app);

app.listen(PORT, console.log(`Index app listening on http://localhost:${PORT}`))