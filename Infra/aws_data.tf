# Fetch Splunk Enterprise AMI data
data "aws_ami" "splunk_enterprise_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["splunk_AMI_9.2.0_2024-02-01_00-53-25-7b65de6c-5006-4ca2-bd75-fdba95ae5d9d"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"]
}

# Fetch Splunk SOAR AMI data
data "aws_ami" "splunk_soar_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Splunk SOAR 6.2.0-80ad187b-5f54-4327-9047-fb6fb36e7019"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"]
}