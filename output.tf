output "vpc_id" {
  value = aws_vpc.testing-mb.id
}

output "vpc_name" {
  value = aws_vpc.testing-mb.tags["Name"]
}

output "public_sub" {
  value = [for subnet in aws_subnet.public_sub : "${aws_vpc.testing-mb.tags["Name"]} of ${subnet.id}"]
}

output "private_sub" {
  value = [for subnet in aws_subnet.private_sub : "${aws_vpc.testing-mb.tags["Name"]} of ${subnet.id}"]
}
