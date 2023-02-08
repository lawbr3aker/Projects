const express = require('express');

const app = express();

// routers
app.use("/"        , require('./routes/index.js'))
app.use("/echo/"   , require('./routes/echo/index.js'))
app.use("/foxtrot/", require('./routes/foxtrot/index.js'))

// invalid url
app.get("*", (req, res, next) => {
    res.send("<h1>FAILED! Fix your URL.</h1>")
});

// start listening
app.listen(3000);