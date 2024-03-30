<?php
    session_start();
    $topic = $_POST['topic'];    
    $comm = $_POST['comment'];
    $id = $_POST['id'];
    $conn = new PDO("mysql:host=localhost;dbname=webboard;charset=utf8","root","");
    
    $_SESSION['add_edit'] = "success";
    $sql = "SELECT * FROM post WHERE post.id = $id";
        foreach($conn->query($sql) as $row){
            $sql = "UPDATE post SET title = '$topic' , content = '$comm' WHERE post.id = $id";
            $conn->exec($sql);
            header("location:editpost.php?id=$id");
            die();
        }
    $conn = null;
?>