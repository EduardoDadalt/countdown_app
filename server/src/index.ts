import express from "express";
import router from "./router";
import "dotenv/config";

const app = express();
const port = process.env.PORT || 3000;

app.use(express.urlencoded());

app.use(express.json());

app.use(router);

app.listen(port, () => {
  console.log(`Server started on port http://localhost:${port} !`);
});
