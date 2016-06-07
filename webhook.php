<?php

print_r($_SERVER);

$shellStatus = shell_exec("/var/build-sites/spamty.website.sh");
print_r($shellStatus);
