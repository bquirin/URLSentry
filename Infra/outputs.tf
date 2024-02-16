# Splunk Enterprise
output "splunk_enterprise_gui" {
    value = "${aws_instance.splunk_enterprise_instance.public_ip}:8000" 
}

output "splunk_enterprise_ssh" {
    value = "ssh -i '${aws_instance.splunk_enterprise_instance.key_name}.pem' ec2-user@${aws_instance.splunk_enterprise_instance.public_ip}"
}

output "splunk_enterprise_gui_username" {
    value = "admin" 
}

output "splunk_enterprise_gui_passwd" {
    value = "SPLUNK-${aws_instance.splunk_enterprise_instance.id}" 
}

# Splunk SOAR
output "splunk_soar_gui_" {
    value = "https://${aws_instance.splunk_soar_instance.public_ip}" 
}

output "splunk_soar_ssh" {
    value = "ssh -i '${aws_instance.splunk_soar_instance.key_name}.pem' centos@${aws_instance.splunk_soar_instance.public_ip}"
}

output "splunk_soar_gui_username" {
    value = "soar_local_admin" 
}

output "splunk_soar_gui_passwd" {
    value = aws_instance.splunk_soar_instance.id
}

