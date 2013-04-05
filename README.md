A puppet module for allowing installation of Microsoft .Net Windows services using InstallUtil.exe

##Installation

The best way to install this module is with the puppet module subcommand or the puppet-module Gem. On your puppet master, execute the following command, optionally specifying your puppet master's modulepath in which to install the module:

    $ puppet module install [--modulepath <path>] joshcooper/powershell

See the section Installing Modules for more information.
##Installation from source

If you'd like to install this module from source, please simply clone a copy into your puppet master's modulepath. Here is an example of how to do so for Puppet Enterprise:

    $ cd /etc/puppetlabs/puppet/modules $ git clone
    git://github.com/joshcooper/puppetlabs-powershell.git powershell

##Examples

To install a Microsoft .Net version 2 Windows Service:

Ensure your .Net Win Service has a service installer and service process installer class -
See [How to: Add Installers to Your Service Application] (http://msdn.microsoft.com/en-gb/library/ddhy0byf.aspx)

    dotnetwinservice {'MyWinService':
        ensure        => present,
        dotnetversion => '2.0.50727', #note no initial v
        sixtyfourbit  => false,
        path          => 'C:\Program Files(x86)\MyWinService\MyWinService.exe',
    }

Note:  The type title must match the Windows Service short name

##License

[Apache License, Version 2.0] (http://www.apache.org/licenses/LICENSE-2.0.html)

##Known Issues

    +Very untested all round
    +Untested on 64bit apps
    +Doesn't support passing username and password as installutil parameters
    
