use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Test::YAML::Valid',
    AUTHOR              => 'Jonathan Rockway <jrockway@cpan.org>',
    VERSION_FROM        => 'lib/Test/YAML/Valid.pm',
    ABSTRACT_FROM       => 'lib/Test/YAML/Valid.pm',
    PL_FILES            => {},
    PREREQ_PM => {
		  'YAML' => 0,
		  'Test::Builder' => 0,
		  'Test::More' => 0,
		  'Directory::Scratch' => 0,
		  'Exporter' => 0,
		 },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Test-YAML-Valid-*' },
);
