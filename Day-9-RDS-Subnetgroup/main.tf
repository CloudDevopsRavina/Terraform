

resource "aws_db_instance" "rds-db" {
    identifier = "database1"
    engine = "mysql"
    instance_class = "db.t3.micro"
    allocated_storage = 20

    username = "admin"
    password = "Ravina123"

    publicly_accessible = true
    skip_final_snapshot = true
  
}