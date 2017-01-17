var keystone = require('keystone');
var Types = keystone.Field.Types;

var Product = new keystone.List('Product');
Product.add({
    name: { type: String, required: true },
    team: { type: String },
    publishedStatus: { type: Types.Select, options: 'draft, published', default: 'draft' },
    createdAt: { type: Date, default: Date.now }

});

//our virtual property to display full title
Product.schema.virtual('fulltitle').get(function() {
    return this.title + ' ' + this.team;
});

Product.register();


// Defining Virtual Properties
// Virtual properties are accessors and mutators that allow us to format our fields when
// retrieving them from a model or setting their value. To define a virtual property, we add it
// to the underlying Mongoose schema. Let us add a virtual property that returns the full title
// of a product which is a combination of product name and product team name

// When we fetch a document from our Mongo DB, we can use the virtual property as
// 1 console.log(productObj.fulltitle);
