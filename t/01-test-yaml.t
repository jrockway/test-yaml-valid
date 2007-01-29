#!/usr/bin/perl
# 01-test-yaml.t 
# Copyright (c) 2007 Jonathan Rockway <jrockway@cpan.org>

use strict;
use warnings;
use Test::More tests => 4;
use Test::YAML::Valid;
use Directory::Scratch;
use YAML qw(DumpFile);

my $yaml =<<'YAML';
baz:
  - quux
  - quuuux
  - quuuuuux
  - car
  - cdr
foo: bar
YAML

yaml_string_ok($yaml, 'YAML string is ok');
yaml_string_ok($yaml);

my $tmp = Directory::Scratch->new();

$tmp->touch('test');
my $file = $tmp->exists('test');
DumpFile($file, $yaml);

yaml_file_ok($file, 'file was OK');
yaml_file_ok($file);
