Puppet::Type.type(:dotnetservice).provide :dotnetwinservice do
  desc "Start webservices via .NET 4 InstallUtil"

  confine     :operatingsystem => :windows
  defaultfor  :operatingsystem => :windows

  INSTALLUTIL = "C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319\\InstallUtil.exe"
  
#  commands :installutil => INSTALLUTIL
  
  def create
    execute ['cmd', '/c', INSTALLUTIL, @resource[:arguments], @resource[:path]].flatten.compact.join(' ')
  end

  def destroy
      Win32::Service.stop( @resource[:name] )
      execute "sc delete #{@resource[:name]}"
  end

  def exists?
      Win32::Service.exists?( @resource[:name] )
  end

end
