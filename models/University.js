var keystone = require('keystone');
var Types = keystone.Field.Types;

var University = new keystone.List('University',{
	autokey: { from: 'name', path: 'slug', unique: true },
    searchFields: 'name',
});

University.add({
        name: { type: String, initial: true, default: '', required: true },  
        location: { type: String, initial: true, default: '', required: true }, 
        alias: { type: String, default:''},           
        createdBy: { type: Types.Relationship, ref: 'User', index: true },
        createdAt: { type: Date, default: Date.now },
        updatedAt: { type: Date, default: Date.now },
        logo: { type: Types.LocalFile, dest: 'public/uploads/uni/logos', label: 'logo'},
        
    });
    
University.schema.virtual('url').get(function() {
		return '/search?keywords='+this.slug;
});

University.defaultSort = '-createdAt';
University.defaultColumns = 'title, location|20%,createdBy|15%,createdAt|15%, logo'; 
University.register();