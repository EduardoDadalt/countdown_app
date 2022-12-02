import "dotenv/config";
import express from "express";
import router from "./router";

const app = express();
const port = process.env.PORT || 3000;

app.use(express.urlencoded({ extended: true }));

app.use(express.json());

app.use(router);

app.listen(port, () => {
  console.log(`Server started on port http://localhost:${port} !`);
});
