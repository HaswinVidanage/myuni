var keystone = require('keystone');

exports = module.exports = function(req, res) {

    var view = new keystone.View(req, res);
    var locals = res.locals;

    // locals.section is used to set the currently selected
    // item in the header navigation.
    locals.section = 'home';

    locals.data = {
        card: {},
    };

    // Load all tickets
    view.on('init', function(next) {

        var q = keystone.list('Card').model.findOne({ slug: req.params.cardslug }).populate('university institute title');

        q.exec(function(err, result) {
            if (result != null) {
                locals.data.card = result;
                console.log("SingleCard : \n " + result);
            } else {
                return res.status(404).send(keystone.wrapHTMLError('Sorry, no ticket found! (404)'));
            }

            next(err);
        });
    });


    // Render the view
    view.render('tickets/singlecard');

};