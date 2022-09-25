const express = require('express');
const app = express();
app.get('/', function(req, res) {
    console.log('data:', req.query.data);
    console.log('type:', typeof req.query.data);
    res.send('hello world');
});

const server = app.listen(3000, function(){
    console.log('app.listen');
})

//  /login
const {uid, upw} = req.query;
db.collection('user').findOne({
    'uid': uid,
    'upw': upw,
})