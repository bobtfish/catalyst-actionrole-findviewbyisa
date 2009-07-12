use inc::Module::Install;

name 'Catalyst-ActionRole-FindViewByIsa';
all_from 'lib/Catalyst/ActionRole/FindViewByIsa.pm';

build_requires 'Catalyst::Runtime';
build_requires 'Test::WWW::Mechanize::Catalyst';
build_requires 'Test::More';
build_requires 'ok';

WriteAll();
