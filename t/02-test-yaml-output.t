#!/usr/bin/perl
# 02-test-yaml-output.t 

use strict;
use warnings;

use FindBin;
use File::Spec::Functions;

use Test::Builder::Tester tests => 3;
use Test::YAML::Valid;

my $yaml =<<'YAML';
baz:
  - quux
  - quuuux
  - quuuuuux
  - car
  - cdr
foo: bar
YAML

my $bad_yaml =<<'BAD_YAML';
baz:
  - quux
  - quuuux
  - quuuuuux
  - car
  - cdr
foo::*)-> bar
BAD_YAML

## test yaml_string_ok ...

test_out("ok 1 - YAML string is ok");
test_out("ok 2");
test_out("not ok 3 - bad YAML string is bad");
test_err("#   Failed test 'bad YAML string is bad'");
test_err("#   at $0 line 45.");
test_out("not ok 4");
test_err("#   Failed test at $0 line 46.");

yaml_string_ok($yaml, 'YAML string is ok');
yaml_string_ok($yaml);
yaml_string_ok($bad_yaml, 'bad YAML string is bad');
yaml_string_ok($bad_yaml);

test_test("yaml_string_ok works");

## test yaml_file_ok ...

my $file = catfile($FindBin::Bin, "yaml", "basic.yml");
my $bad_file = catfile($FindBin::Bin, "yaml", "basic_bad.yml");

test_out("ok 1 - YAML file was ok");
test_out("ok 2 - $file contains valid YAML");
test_out("not ok 3 - bad YAML file was bad");
test_err("#   Failed test 'bad YAML file was bad'");
test_err("#   at $0 line 66.");
test_out("not ok 4 - $bad_file contains valid YAML");
test_err("#   Failed test '$bad_file contains valid YAML'");
test_err("#   at $0 line 67.");

yaml_file_ok($file, 'YAML file was ok');
yaml_file_ok($file);
yaml_file_ok($bad_file, 'bad YAML file was bad');
yaml_file_ok($bad_file);

test_test("yaml_file_ok works");

## test yaml_files_ok ...

my $dir = catfile($FindBin::Bin, "yaml", "all_valid");
my $bad_dir = catfile($FindBin::Bin, "yaml");

test_out("ok 1 - YAML files are all ok");
test_out("ok 2 - $dir/* contains valid YAML files");
test_out("not ok 3 - bad YAML files are not all ok");
test_err("#   Failed test 'bad YAML files are not all ok'");
test_err("#   at $0 line 89.");
test_err("#   Could not load file: $bad_file.");
test_out("not ok 4 - $bad_dir/* contains valid YAML files");
test_err("#   Failed test '$bad_dir/* contains valid YAML files'");
test_err("#   at $0 line 90.");
test_err("#   Could not load file: $bad_file.");

yaml_files_ok("$dir/*", 'YAML files are all ok');
yaml_files_ok("$dir/*");
yaml_files_ok("$bad_dir/*", 'bad YAML files are not all ok');
yaml_files_ok("$bad_dir/*");

test_test("yaml_files_ok works");
