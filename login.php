<?php
$conn = mysqli_connect("localhost","root","","Library");
if(!$conn){
    die("Connected Field");
}
$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT * FROM login_Requirement WHERE email='$email' AND password='$password'";
$result = mysqli_query($conn,$sql);

if(mysqli_num_rows($result)>0){
    header("location: page");
    exit();
}
else{
    echo"Login Field";
}
mysqli_close($conn);
?>