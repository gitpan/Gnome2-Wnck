#!/usr/bin/perl -w
use strict;
use Test::More tests => 8;

use Gnome2::Wnck;

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

SKIP: {
  my $window = $screen -> get_active_window();
  skp("no active window found", 8) unless (defined($window));

  my $application = $window -> get_application();

  isa_ok($application -> get_icon(), "Gtk2::Gdk::Pixbuf");
  isa_ok($application -> get_mini_icon(), "Gtk2::Gdk::Pixbuf");

  like($application -> get_xid(), qr/^\d+$/);
  like($application -> get_pid(), qr/^\d+$/);
  like($application -> get_n_windows(), qr/^\d+$/);
  ok($application -> get_name());
  ok($application -> get_icon_name());

  isa_ok(($application -> get_windows())[0], "Gnome2::Wnck::Window");

  # $application -> get_icon_is_fallback();
  # $application -> get_startup_id();
}
