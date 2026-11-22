#!/bin/bash
dnf update -y
dnf install -y httpd
systemctl enable --now httpd
cat > /var/www/html/index.html <<'HTML'
<html>
<head><title>Project 20 Load Balancer</title></head>
<body style="font-family:Arial;text-align:center;margin-top:100px">
<h1>Project 20 - Load Balanced Application</h1>
<h2 style="color:green">SERVER 2</h2>
<p>Request served by EC2 Instance 2</p>
</body>
</html>
HTML
