Puppet::Type.newtype(:dotnetservice) do
  @doc = "Allows installation of Microsoft .Net based windows services using InstallUtil.exe"

  ensurable

  newparam(:name) do
    desc "Windows Service short name"
  end

  newparam(:path) do
    desc "Path to dotnet service exe. Assumes dotnet exe can be installed by intallutil.exe. Will be auto-required. "
  end

  newparam(:arguments) do
    desc "command line options for service"
  end
end