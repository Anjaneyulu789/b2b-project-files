resource "aws_db_instance" "my_database" {
  identifier           = "b2b-database"
  allocated_storage    = 30  # Size of the storage allocated in GB
  engine               = "mysql"  # Database engine type (MySQL, PostgreSQL, etc.)
  engine_version       = "8.0"   # Engine version
  instance_class       = "db.t3.medium"  # Instance type
  username             = "admin"  # Replace with your desired username
  password             = "Password123!"  # Replace with your desired password
  parameter_group_name = "default.mysql8.0"  # Parameter group name for fine-tuning
  publicly_accessible  = false  # Set to true if you want the database to be publicly accessible
  skip_final_snapshot  = false
  final_snapshot_identifier = "myfinalsnapshot"
  allow_major_version_upgrade = true  # Add this line if you are upgrading to a new major version
}