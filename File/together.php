<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        // list.php는 $directory의 파일들 중 . .. index.html을 제외하고 나열합니다.
        // list.php
        $directory = './uploads/';
        $scanned_directory = array_diff(scandir($directory), array('..', '.', 'index.html'));
        foreach ($scanned_directory as $key => $value) {
            echo "<li><a href='{directory}{&value}'>".$value."</a></li><br/>";
        }
    ?>

    <?php 
        // upload.php는 이용자가 업로드한 파일을 uploads폴더에 복사하며, 이용자는
        // http://host1.dreamhack.games:[PORT]/uploads/[FILENAME] URL을 통해 접근할 수 있습니다.
        // 같은 이름의 파일이 있다면 already exists 라는 메세지를 반환합니다.
        if($_SERVER['REQUEST_METHOD']==='POST'){
            if(isset($_FILES)){
                $directory = './uploads/';
                $file = $_FILES["file"];
                $error = $file["error"];
                $name = $file["name"];
                $tmp_name = $file["tmp_name"];

                if( $error > 0 ) {
                    echo "Error: " . $error . "<br>";
                } else {
                    if (file_exists($directory . $name)) {
                        echo $name . "already exists. ";
                    }else {
                        if(move_uploaded_file($tmp_name, $directory . $name)) {
                            echo "Stored in: " . $directory . $name;
                        }
                    }
                }
            } else {
                echo "Error!";
            }
            die();
        }
    ?>
</body>
</html>