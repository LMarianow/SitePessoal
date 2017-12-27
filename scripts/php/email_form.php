<?php

$name= filter_var($_POST["name"], FILTER_SANITIZE_STRING);
$fromemail = filter_var($_POST["fromemail"], FILTER_SANITIZE_EMAIL);
$usercomments = filter_var($_POST["usercomments"], FILTER_SANITIZE_STRING);

if(isset($_POST["spam"]) && $_POST["spam"] == "") {
    // Constuct and send email from form information if the spam field is blank.
    $to = "admin@lmariano.me";

    $msg = "Nome: " . $name . "\n";
    $msg .= "Email: " . $fromemail . "\n";
    $msg .= "Comentarios:\n" . $usercomments;

    $subject = "Email de " . $name . ", via lmariano.me";

    $headers = "Para: " . $to;
    if($fromemail && !preg_match("/[\r\n]/", $fromemail)) {
        $headers = "Para: " . $fromemail;
    }

    mail($to, $subject, $msg, $headers);
}

header("Location: ../../index.php?message=success#contact");
