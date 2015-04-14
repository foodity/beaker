require 'beaker/hypervisor/vagrant'

class Beaker::VagrantEc2 < Beaker::Vagrant
  def provision(provider = 'aws')
    super
  end

  def self.provider_vfile_section(host, options)
    provider_section  = ""
    provider_section << "    v.vm.provider :aws do |aws, override|\n"
    provider_section << "      aws.access_key_id = #{host['aws_access_key_id']}\n"
    provider_section << "      aws.secret_access_key = #{host['aws_secret_access_key']}\n"
    provider_section << "      aws.keypair_name = \"#{host['aws_keypair_name']}\"\n"
    provider_section << "      aws.ami = \"#{host['aws_ami']}\"\n"
    provider_section << "    end\n"

    provider_section
  end
end
