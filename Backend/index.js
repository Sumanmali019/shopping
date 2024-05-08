//import from packages
const express = require("express");
const mongoose = require("mongoose");

//import from other files
const authRouter = require("./routes/auth");

//INIT
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://sumanmali019:Sumanmali019@cluster0.ayf7jik.mongodb.net/";

//middleware
app.use(express.json());
app.use(authRouter);

//connection to db
mongoose
  .connect(DB)
  .then(() => {
    console.log("connected..");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`listening on port ${PORT}`);
});
