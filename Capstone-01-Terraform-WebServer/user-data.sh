#!/bin/bash

dnf update -y
dnf install -y httpd

systemctl enable httpd
systemctl start httpd

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Terraform Web Server</title>
</head>
<body>
<h1>Linux EC2 Web Server using Terraform</h1>
<h2>Capstone Project</h2>
<p>Hosted on AWS using Terraform</p>
</body>
</html>
EOF
