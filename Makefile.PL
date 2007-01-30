use strict;
use warnings;
use inc::Module::Install;

name('Test-YAML-Valid');
author('Jonathan Rockway <jrockway@cpan.org');
version_from('lib/Test/YAML/Valid.pm');
abstract_from('lib/Test/YAML/Valid.pm');
license('Perl');
include('ExtUtils::AutoInstall');

requires('YAML');
requires('Exporter');
requires('Test::Builder');

build_requires('Test::More');
build_requires('File::Spec');

auto_install();
WriteAll();
