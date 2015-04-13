require 'beaker/hypervisor/vagrant'

class Beaker::VagrantEc2 < Beaker::Vagrant
  def provision(provider = 'aws')
    super
  end

  def self.provider_vfile_section(host, options)
    provider_section  = ""
    provider_section << "    v.vm.provider :aws do |aws, override|\n"
    provider_section << "      aws.access_key_id = #{options['aws_access_key_id']}"
    provider_section << "      aws.secret_access_key = #{options['aws_secret_access_key']}"
    provider_section << "      aws.keypair_name = \"#{options['aws_keypair_name']}\" "
    provider_section << "      aws.ami = \"#{options['aws_ami']}\""
    provider_section << "    end\n"

    provider_section
  end
end
