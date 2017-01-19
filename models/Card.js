var keystone = require('keystone');

var Types = keystone.Field.Types;

var Card = new keystone.List('Card',{
	autokey: { from: 'title institute university', path: 'slug', unique: true },
    searchFields: 'description',
});

Card.add({
        title: { type: Types.Relationship,ref: 'Course', index: true,  initial: true, required: true },
        institute: { type: Types.Relationship, ref: 'Institute', index: true,initial: true, required: true },
        university: { type: Types.Relationship, ref: 'University', index: true ,initial: true, required: true},
        fee:{ type: Types.Money},       
        category: { type: Types.Select, options: 'Comuputer Science, Agriculture, Arts', default: 'Arts' },
        duration: { type: Types.Select, options: '1,2,3,4,5', default: '4' },
        entry_req: { type: Types.Textarea },
        description: { type: Types.Textarea },
        rating: { type: Types.Select, options: '1,2,3,4,5', default: '5' },
        createdBy: { type: Types.Relationship, ref: 'User', index: true },
        createdAt: { type: Date, default: Date.now },
        updatedAt: { type: Date, default: Date.now },
        tags: { type: Types.Relationship, ref: 'Tag', many: true },
    });
    
Card.schema.virtual('url').get(function() {
		return '/Cards/'+this.slug; //change this later on 
	 
});


Card.defaultSort = '-createdAt';
Card.defaultColumns = 'title, status|20%, createdBy, assignedTo, createdAt|15%'; 
Card.register();
