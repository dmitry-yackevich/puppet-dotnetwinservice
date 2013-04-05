dotnetwinservice {'MyApp4':
    ensure        => absent,
    dotnetversion => '4.0.30319',
    sixtyfourbit  => false,
    path          => 'C:\Program Files\myapp4\MyApp4.exe',
}