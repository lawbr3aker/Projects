const express = require('express');

const app = express();
//
const {appConfigs}   = require('./configs.js')
const {appConstants} = require('./constants.js')

// set view engine
app.engine('hbs', appConfigs.engine);
app.set('view engine', 'hbs');

// static routes
app.use(express.static('public'))

// views
app.set('views', 'views');
app.get('/', (req, res) => {
    let image = {
        value: 'Default',
        name : 'Default',
        path : 'images\\Default.jpg'
    }
    if (req.query.image)
        image = appConstants.images.find(image => image.value === req.query.image) ?? image
    // render handlebar
    res.render('gallery', {
        layout: null,
        // parameters
        constants: appConstants,
        image    : image
    });
});

// start listening
app.listen(appConfigs.port);