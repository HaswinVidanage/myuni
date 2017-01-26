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

        var q = keystone.list('Card').model.find({ createdBy: res.locals.user }).populate('university institute title');

        q.exec(function(err, results) {
            locals.data.cards = results;

            //workaround to filter only needed data
            // results.forEach(function (results) {
            //                          console.log("hello from the other side!!!");
            //            });

            //remove before deploying
            // console.log("university: "+ results[0].university.name); 
            // console.log("institute: "+ results[0].institute.name); 
            // console.log("course: "+ results[0].title.name); 
            // console.log("result : "+results);

            next(err);
        });

    });




    // Render the view
    view.render('tickets/mycard');

};