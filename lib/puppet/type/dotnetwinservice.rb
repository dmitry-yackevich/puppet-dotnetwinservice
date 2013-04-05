Puppet::Type.newtype(:dotnetwinservice) do
  @doc = "Allows installation of Microsoft .Net based windows services using InstallUtil.exe"

  class CaseInsensitiveProperty < Puppet::Property
    def insync?(is)
      raise Puppet::Error, "Invalid value for attribute '#{name}', must be an array" unless @should.is_a?(Array)

      (is.length == @should.length) and (is.zip(@should).all? { |a, b| property_matches?(a, b) })
    end

    def property_matches?(current, desired)
      current.to_s.casecmp(desired.to_s) == 0
    end
  end

  ensurable

  newparam(:name) do
    desc "Windows Service short name"
  end

  newparam(:path) do
    desc "Path to dotnet service exe. Assumes dotnet exe can be installed by intallutil.exe. Will be auto-required. "
  end

  newparam(:dotnetversion) do
    desc "version of dotnet installutil.exe to be used to install the service"
  end
  
  newparam(:sixtyfourbit) do
    desc "use 64bit version of installutil.exe"
    
    newvalues(:true, :false)
    defaultto false

    validate do |value|
      case value
      when true, /^true$/i, :true, false, /^false$/i, :false, :undef, nil
        true
      else
        # We raise an ArgumentError and not a Puppet::Error so we get manifest
        # and line numbers in the error message displayed to the user.
        raise ArgumentError.new("Validation Error: purge_values must be true or false, not #{value}")
      end
    end

    munge do |value|
      case value
      when true, /^true$/i, :true
        true
      else
        false
      end
    end
  end

  autorequire(:file) do
    self[:path]
  end

  validate do
    if self[:ensure] != :absent
      [:path].each do |attribute|
        raise Puppet::Error, "Attribute '#{attribute}' is mandatory" unless self[attribute]
      end
    end
  end
end