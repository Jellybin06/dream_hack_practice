<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php 
    
        if(!empty($_FILES['FILE'])){
            $filename = "user_uploaded_file_".time();
            $ext = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION); // ./uploads/filename/extenstion // text.php
            $path = "./uploads/" . $filename . "." . $ext;

            if(move_uploaded_file($_FILES['file']['tmp_name'], $path)) {
                return true;
            } else {
                return false;
            }
        }

    ?>
</body>
</html>