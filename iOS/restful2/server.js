var express = require('express'),
	restful = require('node-restful'),
	mongoose = restful.mongoose;

var app = express();
app.configure(function(){
	app.use(express.bodyParser());
	app.use(express.methodOverride());
});

mongoose.connect('mongodb://localhost/restful');

var ProductScheme = mongoose.Schema({
	name: String,
	sku: String,
	price: Number
});

var Products = restful.model('products', ProductSchema);
Products.methods(['get', 'put', 'post', 'delete']);
Products.register(app, '/api/products');

app.listen(3000);
console.log('Server is running at port 3000');

