var keystone = require('keystone');
var Types = keystone.Field.Types;

var Course = new keystone.List('Course',{
	autokey: { from: 'name', path: 'slug', unique: true },
    searchFields: 'name',
});

Course.add({
        name: { type: String, initial: true, default: '', required: true },            
        createdBy: { type: Types.Relationship, ref: 'User', index: true },
        createdAt: { type: Date, default: Date.now },
        updatedAt: { type: Date, default: Date.now },
    });
    
Course.schema.virtual('url').get(function() {
		return '/search?keywords='+this.slug;
});

Course.defaultSort = '-createdAt';
Course.defaultColumns = 'title,createdBy|15%,createdAt|15%'; 
Course.register();