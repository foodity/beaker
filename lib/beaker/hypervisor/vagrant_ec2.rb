require 'beaker/hypervisor/vagrant'

class Beaker::VagrantEc2 < Beaker::Vagrant
  def provision(provider = 'aws')
    super
  end

  def self.provider_vfile_section(host, options)
    provider_section  = ""
    provider_section << "    v.vm.provider :aws do |aws, override|\n"
    provider_section << "      aws.access_key_id = \"#{host['aws_access_key_id']}\"\n" unless host['aws_access_key_id'].nil?
    provider_section << "      aws.secret_access_key = \"#{host['aws_secret_access_key']}\"\n" unless host['aws_secret_access_key'].nil?
    provider_section << "      aws.keypair_name = \"#{host['aws_keypair_name']}\"\n" unless host['aws_keypair_name'].nil?
    provider_section << "      aws.instance_type = \"#{host['aws_instance_type'] ||= 't2.micro'}\"\n"
    provider_section << "      aws.ami = \"#{host['aws_ami']}\"\n"
    provider_section << "      aws.region = \"#{host['aws_region'] ||= 'eu_west_1'}\"\n"
    provider_section << "      aws.subnet_id = \"#{host['aws_subnet_id']}\"\n"
    provider_section << "      aws.tags = #{host['aws_tags'] ||= {'Name' => 'Temporary'}}\n"
    provider_section << "      aws.security_groups = #{host['aws_security_groups']}\n" unless host['aws_security_groups'].nil?
    provider_section << "      override.ssh.username = \"ubuntu\"\n"
    provider_section << "      override.ssh.private_key_path = \"#{host['ssh_private_key_path']}\"\n" unless host['ssh_private_key_path'].nil?
    provider_section << "      override.vm.network = :private_network, type: :dhcp\n"


    provider_section << "    end\n"

    provider_section
  end
end
