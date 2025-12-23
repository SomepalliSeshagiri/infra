data "aws_region" "current" {}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${data.aws_region.current.id}.s3"
  vpc_endpoint_type = "Gateway"

  # Only public route table is used now
  route_table_ids = [
    aws_route_table.public.id
  ]

  tags = {
    Name = "s3-endpoint"
  }
}