var keystone = require('keystone');

exports = module.exports = function(req, res) {
	
	var view = new keystone.View(req, res);
	var locals = res.locals;
	
	// locals.section is used to set the currently selected
	// item in the header navigation.
	locals.section = 'tickets';
	
    locals.data = { 
		tickets: [],
	};
    
    // Load all tickets
	view.on('init', function(next) {

		// var q = keystone.list('Ticket').model.paginate({
  //                   page: req.query.page || 1,
  //                   perPage: 1,
  //                   maxPages: 5
  //               });

  	var q = keystone.list('Ticket').model.find( {assignedTo : res.locals.user} );
		
		q.exec(function(err, results) {
			locals.data.tickets = results;
			console.log("Current User : "+ res.locals.user.id);
			next(err);
		});

	}); 
	

    
	// Render the view
	view.render('tickets/myticket');
	
};
