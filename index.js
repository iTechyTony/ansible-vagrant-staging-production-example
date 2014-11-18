const port = process.env.PORT || '8080';
const host = process.env.HOST || '0.0.0.0';
const express = require('express');
const app = express();
const morgan = require('morgan');

app.use(morgan('dev'));

app.use(function (req, res) {
  res.send('Welcome to your webapp!!');
});

app.listen(port, host);

console.log('Server running on, %s:%d', host, port);

module.exports = app;
