#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/WnckWorkspace.t,v 1.9 2004/04/20 15:25:11 kaffeetisch Exp $

unless (Gtk2 -> init_check()) {
  plan skip_all => "Couldn't initialize Gtk2";
}
else {
  Gtk2 -> init();
  plan tests => 7;
}

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

my $workspace = $screen -> get_workspace(0);

SKIP: {
  skip("couldn't get first workspace", 7) unless (defined($workspace));

  is($workspace -> get_number(), 0);
  ok(defined($workspace -> get_name()));

 SKIP: {
    skip("get_width, get_height, get_viewport_x, get_viewport_y and is_virtual are new in 2.3.1", 5)
      unless (Gnome2::Wnck -> CHECK_VERSION(2, 4, 0));

    like($workspace -> get_width(), qr/^\d+$/);
    like($workspace -> get_height(), qr/^\d+$/);
    like($workspace -> get_viewport_x(), qr/^\d+$/);
    like($workspace -> get_viewport_y(), qr/^\d+$/);
    ok(not $workspace -> is_virtual());
  }

  $screen -> get_active_workspace() -> activate();

  # $workspace -> change_name(...);
}
