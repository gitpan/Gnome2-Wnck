#!/usr/bin/perl -w
use strict;
use Test::More tests => 2;

# use Gtk2 -init;
use Gnome2::Wnck;
Gtk2 -> init();

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

isa_ok($screen -> get_active_window() -> create_action_menu(), "Gtk2::Menu");
isa_ok(Gnome2::Wnck -> create_window_menu($screen -> get_windows()), "Gtk2::Menu");

###############################################################################

my $main_window = Gtk2::Window -> new("toplevel");
$main_window -> set_dock_type();
