#!/usr/bin/perl -w
use strict;
use Test::More tests => 1;

use Gnome2::Wnck;

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

my $pager = Gnome2::Wnck::Pager -> new($screen);
isa_ok($pager, "Gnome2::Wnck::Pager");

if (Gnome2::Wnck -> check_version(2, 0, 0)) {
  $pager -> set_screen($screen);
  $pager -> set_shadow_type("etched-in");
}

$pager -> set_orientation("vertical");
$pager -> set_n_rows(3);
$pager -> set_show_all(1);
