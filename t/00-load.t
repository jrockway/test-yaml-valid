#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Test::YAML::Valid' );
}

diag( "Testing Test::YAML::Valid $Test::YAML::Valid::VERSION, Perl $], $^X" );
