const express = require("express");
const app = express();
const routes = require("./routes/routes");
const bodyParser = require("body-parser");
app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser. urlencoded({extended: true}))
app.use(express.static("./public"));

app.use("/", routes);

app.listen(3000);