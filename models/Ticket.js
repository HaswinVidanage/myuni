var keystone = require('keystone');
var Types = keystone.Field.Types;

var Ticket = new keystone.List('Ticket',{
	autokey: { from: 'title', path: 'slug', unique: true },
    searchFields: 'description',
});

Ticket.add({
        title: { type: String, initial: true, default: '', required: true },  
        description: { type: Types.Textarea },   
        priority: { type: Types.Select, options: 'Low, Medium, High', default: 'Low' },
        category: { type: Types.Select, options: 'Bug, Feature, Enhancement', default: 'Bug' },
        status: { type: Types.Select, options: 'New, In Progress, Open, On Hold, Declined, Closed', default: 'New' },
        createdBy: { type: Types.Relationship, ref: 'User', index: true },
        assignedTo: { type: Types.Relationship, ref: 'User', index: true },
        createdAt: { type: Date, default: Date.now },
        updatedAt: { type: Date, default: Date.now },
        rating: { type: Types.Select, options: '1,2,3,4,5', default: '5' },
        image: { type: Types.LocalFile, dest: 'public/uploads/images', label: 'Image 1'},
        tags: { type: Types.Relationship, ref: 'Tag', many: true },
    });
    
Ticket.schema.virtual('url').get(function() {
		return '/tickets/'+this.slug;
	 
});
//pg : 37
// URLs for models
// In the above route, we saw that :ticketslug was used as a query parameter to refer to the
// slug for a Ticket object. The complete URL for a ticket model would the
// /tickets/:ticketslug. This URL is not part of the model yet and in every place we intend to
// use or link to a Ticket, we will need to manually build the URL by concatenating the slug.
// To address this issue, we can use virtual functions to build the canonical URL for Ticket
// objects. The convention we will follow is to add a url() virtual method to the model that
// returns the canonical URL of the object. Edit your Ticket.js model file and add the
// following before a call to the register() method:

Ticket.defaultSort = '-createdAt';
Ticket.defaultColumns = 'title, status|20%, createdBy, assignedTo, createdAt|15%'; 
Ticket.register();

//title: { type: String, initial: true, default: '', required: true },
// title: This is the field for the ticket title. The field can hold a string describing the
// purpose for the ticket. 
    //The default option can be used to specify any default value for the field if the user 
    //does not input a value. The required option is useful to validate
    // that the field has a value before it is saved. A database index is also used to enforce
    // this.

//INITIAL : TRUE ???
// The title field is shown with a text input field in this form as per our definition in the
// model. The title field was marked with initial: true. This causes the field to be shown in
// the create item form, in the Admin UI.


//autokey: { from: 'title', path: 'slug', unique: true },
// slug: The slug is used for SEO friendly URLs. The field is defined as part of the List
// options using the autokey plugin. Autokey automatically generates a key for each
// model when it is saved, based on the value of another field. The value of the key is
// accessible via the ‘slug’ field on the object. In this case, we create a slug for each
// ticket from the title. The unique option indicates that we expect the key to be unique
// throughout the collection. If we create a ticket with the title set to ‘My First Ticket’
// then the automatically generated slug would be similar to ‘my-first-ticket’

//priority: { type: Types.Select, options: 'Low, Medium, High', default: 'Low' },
// description: This is the field to will be used to store the description of the ticket. The
// Textarea field type will display a text area within the admin UI.

// priority: This is a field to the priority of the ticket. We use a select field type, so the
// value for this field can be set to one of the given choices. The category & status fields
// are set up in a similar manner.

//createdBy: { type: Types.Relationship, ref: 'User', index: true, many: false },
// createdBy: This field will hold a reference to the user that created a ticket. The field
// is like a foreign key that defines many to one relationships in a relational database.
// This field is displayed as an auto-suggest text box in the admin UI that allows us to
// pick a single user. Setting the many option to false indicates that only a single user
// can be selected. Setting the index option to true will tell keystone.js that we are
// interested in a database index to be created for this field. The assignedTo field is a
// similar relationship field that is used to store a reference to the user that the ticket is
// currently assigned to. This is the user that will be incharge of resolving the issue
// mentioned in the ticket.


// createdAt: { type: Datetime, default: Date.now },
// createdAt: This datetime field indicates when the ticket was created by the user.
// Since we are using the default value of Date.now, the date will be saved
// automatically when creating a new ticket object.

// By setting the defaultSort property on the model, We are telling keystone.js to sort results
// by the createdAt field in descending order by default when we query the database. We
// specify descending order by using the negative prefix.

// When all the fields and options have been set on our model, a call to Ticket.register()
// will register the list with Keystone and finalise its configuration.

//SEARCH IN ADMIN UI
// By default the search will look for data in a field that has been specified in the
// autokey.from path. In the case of searching for tickets that would be the title field. We can
// also specify a comma-delimited list of fields to use for searching in Admin UI.

//http://keystonejs.com/docs/database/#fieldtypes