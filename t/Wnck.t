#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/Wnck.t,v 1.8 2005/02/24 18:16:17 kaffeetisch Exp $

unless (Gtk2 -> init_check()) {
  plan skip_all => "Couldn't initialize Gtk2";
}
else {
  Gtk2 -> init();
  plan tests => 2;
}

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

SKIP: {
  my $active_window = $screen -> get_active_window();
  skip("no active window found", 1) unless (defined($active_window));
  isa_ok($active_window -> create_action_menu(), "Gtk2::Menu");
}

SKIP: {
  skip("removed method", 1)
    if (Gnome2::Wnck -> CHECK_VERSION(2, 9, 91)); # FIXME: 2.10

  isa_ok(Gnome2::Wnck -> create_window_menu($screen -> get_windows()), "Gtk2::Menu");
}
