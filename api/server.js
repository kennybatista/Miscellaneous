// Dependencies
var express = require('express');
var mongoose = require('mongoose');
var bodyParser = require('body-parser');
mongoose.Promise = Promise

// //MongoDB
// mongoose.connect('mongodb://localhost/rest_test');


// Express
var app = express();
// parse appliation/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true}));
// parse application/json
app.use(bodyParser.json());

// Routes
app.use('/api', require('./routes/api'));





// Start server
app.listen(3004);
console.log('API is running on port 3004');