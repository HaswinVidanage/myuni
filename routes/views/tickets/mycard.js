var keystone = require('keystone');

exports = module.exports = function(req, res) {
	
	var view = new keystone.View(req, res);
	var locals = res.locals;
	
	// locals.section is used to set the currently selected
	// item in the header navigation.
	locals.section = 'tickets';
	
    locals.data = { 
		cards: [],
	};
    
    // Load all tickets
	view.on('init', function(next) {

		// var q = keystone.list('Ticket').model.paginate({
  //                   page: req.query.page || 1,
  //                   perPage: 1,
  //                   maxPages: 5
  //               });

  	var q = keystone.list('Card').model.find({createdBy : res.locals.user}).populate('university institute title');		 

		q.exec(function(err, results) {
			locals.data.cards = results;

			//workaround to filter only needed data
			results.forEach(function (results) {
                            console.log("hello from the other side!!!");
              });
			//console.log("result : "+results);
			console.log("university: "+ results[0].university.name); // Joe
			console.log("institute: "+ results[0].institute.name); // Joe
			console.log("course: "+ results[0].title.name); // Joe
 		//  	console.log("university : "+results.populated('university'));  // '1234af9876b024c680d111a1' -> _id			
			next(err);
		});

	}); 

	

    
	// Render the view
	view.render('tickets/mycard');
	
};
