data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "public" {
  id = "subnet-02a246541c0a65ad4"
}

resource "aws_security_group" "ec2_sg" {
  name   = "cloudwatch-alarm-sg-krishnesh"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "alarm_ec2" {
  ami                    = "ami-0364d75feb34303d8"
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "Starting automatic CPU load test..." > /var/log/cpu-stress.log
    nohup timeout 300 bash -c 'while true; do :; done' >> /var/log/cpu-stress.log 2>&1 &
  EOF

  user_data_replace_on_change = true

  tags = {
    Name = "CloudWatchAlarmServer"
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "HighCPU-Krishnesh"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 10

  dimensions = {
    InstanceId = aws_instance.alarm_ec2.id
  }

  alarm_description = "Alarm when CPU exceeds 10%"
}

