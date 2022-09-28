const express = require('express');
const app = express();
const mongoose = require('mongoose');
const db = mongoose.connection;
mongoose.connect('mongodb://localhost:27017/', { userNewUrlParser:true, useUnifiedTopology: true});
app.get('/query', function(req, res) {
    db.collection('user').find({
        'uid': req.query.uid,
        'upw': req.query.upw
    }).toArray(function(err, result) {
        if(err) throw err;
        res.send(result)
    })
})

const server = app.listen(3000, function(){
    console.log('app.listen');
})