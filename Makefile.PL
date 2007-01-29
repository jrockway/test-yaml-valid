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
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Test-YAML-Valid-*' },
);
