// $expr : 쿼리 언어 내에서 집계 식을 사용할 수 있습니다.
// $regex : 지정된 정규식과 일치하는 문서 선택
// $text : 지정된 텍스트 검색
// $where : JavaScript 표현식을 만족하는 문서와 일치합니다.

//REGEX
db.user.find({upw: {$regex: "^a"}}) // 값x
db.user.find({upw: {$regex: "^b"}}) // 값x
db.user.find({upw: {$regex: "^c"}}) // 값x

db.user.find({upw: {$regex: "^g"}}) // --> { "_id" : ObjectId("5ea0110b85d34e079adb3d19"), "uid" : "guest", "upw" : "guest" }


//WHERE
db.user.find({&where:"return 1==1"})
