output "vpc_id" {
  value = aws_vpc.testing-mb.id
}

output "vpc_name" {
  value = aws_vpc.testing-mb.tags["Name"]
}

output "public_sub" {
  value = aws_subnet.public_sub.*.id
}

output "private_sub" {
  value = aws_subnet.private_sub.*.id
}

