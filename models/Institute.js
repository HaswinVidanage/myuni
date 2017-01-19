var keystone = require('keystone');
var Types = keystone.Field.Types;

var Institute = new keystone.List('Institute',{
	autokey: { from: 'name', path: 'slug', unique: true },
    searchFields: 'name',
});

Institute.add({
        name: { type: String, initial: true, default: '', required: true },  
        location: { type: String, initial: true, default: '', required: true }, 
        alias: { type: String, default:''},
        rating: { type: Types.Select, options: '1,2,3,4,5', default: '5' },           
        createdBy: { type: Types.Relationship, ref: 'User', index: true },
        createdAt: { type: Date, default: Date.now },
        updatedAt: { type: Date, default: Date.now },
        logo: { type: Types.LocalFile, dest: 'public/uploads/inst/logos', label: 'logo'},
    });
    
Institute.schema.virtual('url').get(function() {
		return '/search?keywords='+this.slug;
});

Institute.defaultSort = '-createdAt';
Institute.defaultColumns = 'title, location|20%,createdBy|15%,createdAt|15%, logo'; 
Institute.register();