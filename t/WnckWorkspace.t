#!/usr/bin/perl -w
use strict;
use Test::More tests => 7;

use Gnome2::Wnck;

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

my $workspace = $screen -> get_workspace(0);

is($workspace -> get_number(), 0);
ok(defined($workspace -> get_name()));

SKIP: {
  skip("get_width, get_height, get_viewport_x, get_viewport_y and is_virtual are new in 2.3.1", 5)
    unless (Gnome2::Wnck -> check_version(2, 3, 1));

  like($workspace -> get_width(), qr/^\d+$/);
  like($workspace -> get_height(), qr/^\d+$/);
  like($workspace -> get_viewport_x(), qr/^\d+$/);
  like($workspace -> get_viewport_y(), qr/^\d+$/);
  ok(not $workspace -> is_virtual());
}

$screen -> get_active_workspace() -> activate();

# $workspace -> change_name(...);
