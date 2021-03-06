#
# Import idrac configuration
#

Puppet::Type.newtype(:importsystemconfiguration) do
  @doc = "Import idrac system configuration."

  ensurable do
    newvalue(:present) do
      provider.create
    end
    defaultto(:present)
  end

  newparam(:name) do
    desc "The test name."
    munge do |value|
      value.to_s
    end

    validate do |value|
      if value.strip.length == 0
        raise ArgumentError, "The name must contain a value. It cannot be null."
      end
    end
  end

  newparam(:configxmlfilename) do
    desc "Config Xml file name."
    munge do |value|
      value.to_s
    end

    validate do |value|
      if value.strip.length == 0
        raise ArgumentError, "The Config Xml file name must contain a value. It cannot be null."
      end
    end
  end

  newparam(:nfsipaddress) do
    desc "NFS Server ipaddress."
    munge do |value|
      value.to_s
    end

    validate do |value|
      if value.strip.length == 0
        raise ArgumentError, "The nfsipaddress must contain a value. It cannot be null."
      end
    end
  end

  newparam(:nfssharepath) do
    desc "NFS share path."
    munge do |value|
      value.to_s
    end

    validate do |value|
      if value.strip.length == 0
        raise ArgumentError, "The nfssharepath must contain a value. It cannot be null."
      end
    end
  end

  newparam(:enable_npar) do
    desc "Whether nic partitioning should be enabled"
    newvalues(true, false)
    defaultto(true)
  end

  newparam(:sysprofile) do 
    desc "power setting as configured in idrac via sysprofile"
    munge do |value|
      value.to_s
    end
  end

  newparam(:target_boot_device) do 
    desc "Either SD, HD, or SAN for SD card, Hard Drive, or SAN boot"
    munge do |value|
      value.to_s
    end

    validate do |value|
      if value.strip.length == 0
        raise ArgumentError, "The target_boot_device must contain a value. It cannot be null."
      end
    end
  end

  newparam(:servicetag) do
    desc "The Dell server service tag, e.g. JH870W1"
    munge do |value|
      value.to_s
    end

    validate do |value|
      if value.strip.length == 0
        raise ArgumentError, "servicetag must contain a value. It cannot be null."
      end
    end
  end

  newparam(:model) do
    desc "The Dell server model, e.g. m420, m620, m820, r620, r720."
    munge do |value|
      value.to_s
    end

    validate do |value|
      if value.strip.length == 0
        raise ArgumentError, "model must contain a value. It cannot be null."
      end
    end
  end

  newparam(:config_xml) do
    desc "The config.xml blob to use instead of exporting the server configuration"
    munge do |value|
      value.to_s
    end
  end


end
