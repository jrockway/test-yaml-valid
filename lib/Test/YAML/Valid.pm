package Test::YAML::Valid;

use warnings;
use strict;
use YAML qw(Load LoadFile);
use Test::Builder;
use base 'Exporter';

our @EXPORT_OK = qw(yaml_string_ok yaml_file_ok);
our @EXPORT = @EXPORT_OK;

=head1 NAME

Test::YAML::Valid - Test for valid YAML

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This module lets you easily test the validity of YAML:

    use Test::More tests => 3;
    use Test::YAML::Valid;

    yaml_string_ok(YAML::Dump({foo => 'bar'}), 'YAML generates good YAML?');
    yaml_string_ok('this is not YAML, is it?', 'This one will fail');
    yaml_file_ok('/path/to/some/YAML', '/path/to/some/YAML is YAML');

=head1 EXPORT

=over 4

=item * yaml_string_ok

=item * yaml_file_ok

=back

=head1 FUNCTIONS

=head2 yaml_string_ok($yaml, [$message])

=cut

sub yaml_string_ok($;$) {
    my $yaml = shift;
    my $msg  = shift;
    my $result;
    
    my $test = Test::Builder->new();
    eval {
	$result = Load($yaml);
    };
    $test->ok(!$@, $msg);
    return $result;
}

=head2 yaml_file_ok($filename, [$message])

=cut

sub yaml_file_ok($;$) {    
    my $file = shift;
    my $msg  = shift;
    my $result;
    
    my $test = Test::Builder->new();
    eval {
	$result = LoadFile($file);
    };

    $msg = "$file contains valid YAML" unless $msg;
    
    $test->ok(!$@, $msg);
    return $result;
}

=head1 AUTHOR

Jonathan Rockway, C<< <jrockway at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-test-yaml-valid at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Test-YAML-Valid>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Test::YAML::Valid

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Test-YAML-Valid>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Test-YAML-Valid>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Test-YAML-Valid>

=item * Search CPAN

L<http://search.cpan.org/dist/Test-YAML-Valid>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2007 Jonathan Rockway, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Test::YAML::Valid
