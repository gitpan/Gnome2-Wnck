#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/WnckApplication.t,v 1.6 2004/02/16 16:14:31 kaffeetisch Exp $

unless (Gtk2 -> init_check()) {
  plan skip_all => "Couldn't initialize Gtk2";
}
else {
  Gtk2 -> init();
  plan tests => 8;
}

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

SKIP: {
  my $window = $screen -> get_active_window();
  skip("no active window found", 8) unless (defined($window));

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
