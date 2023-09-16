require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
const port = process.env.PORT;

const logRequest = require("./middlewares/logRequest");
const errorHandler = require("./middlewares/errorHandler");
const authController = require("./controllers/authController");
const memberController = require("./controllers/memberController");
const pegawaiController = require("./controllers/pegawaiController");
const instrukturController = require("./controllers/instrukturController");

//middlewares
app.use(cors());
app.use(express.json());
app.use(logRequest);

//controllers (routes)
app.use("/auth", authController);
app.use("/members", memberController);
app.use("/pegawais", pegawaiController);
app.use("/instrukturs", instrukturController);
app.use(errorHandler); //error handler middleware

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
