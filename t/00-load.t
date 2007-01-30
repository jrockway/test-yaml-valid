#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Test::YAML::Valid' );
}

diag( "Testing Test::YAML::Valid $Test::YAML::Valid::VERSION, Perl $], $^X" );
eval {
    require YAML;
    diag("YAML version $YAML::VERSION");
};
if($@){
    diag("No YAML found");
}

eval {
    require YAML::Syck;
    diag("YAML::Syck version $YAML::Syck::VERSION");
};
if($@){
    diag("No YAML::Syck found");
}
