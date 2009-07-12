use inc::Module::Install 0.91;

name 'Catalyst-ActionRole-FindViewByIsa';
all_from 'lib/Catalyst/ActionRole/FindViewByIsa.pm';
license 'perl';

test_requires 'Catalyst::Runtime';
test_requires 'Test::More';

if ($Module::Install::AUTHOR) {
    system("pod2text lib/Catalyst/ActionRole/FindViewByIsa.pm > README") and die;
}

WriteAll;

