module "mysql" {
  source               = "terraform-aws-modules/rds/aws"
  allocated_storage    = 20
  identifier           = "test-db"
  db_name              = "demodb"
  engine               = "mysql"
  engine_version       = "8.0.32"
  major_engine_version = "8.0"
  family               = "mysql8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin123"
  publicly_accessible  = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
  depends_on = [ aws_db_subnet_group.db_subnet_group, aws_security_group.custom_sg ]
  vpc_security_group_ids = [aws_security_group.custom_sg.id]
  skip_final_snapshot  = false
}

#create subnet_group
resource "aws_db_subnet_group" "db_subnet_group" {
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
  tags = {
    Name="db_subnet_group"
  }
}
