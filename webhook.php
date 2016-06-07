<?php

print_r($_SERVER);

$shellStatus = shell_exec("./spamty.website.sh");

print_r($shellStatus);
