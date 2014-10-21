#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/WnckClassGroup.t,v 1.1 2004/04/20 15:25:11 kaffeetisch Exp $

unless (Gtk2 -> init_check()) {
  plan skip_all => "Couldn't initialize Gtk2";
}
else {
  Gtk2 -> init();
  plan tests => 6;
}

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

SKIP: {
  skip("WnckClassGroup is new in 2.6.0", 6)
    unless (Gnome2::Wnck -> CHECK_VERSION(2, 6, 0));

  my $window = $screen -> get_active_window();
  skip("no active window found", 6) unless (defined($window));

  my $group = $window -> get_class_group();

  isa_ok(($group -> get_windows())[0], "Gnome2::Wnck::Window");
  ok(defined($group -> get_res_class()));
  ok(defined($group -> get_name()));
  isa_ok($group -> get_icon(), "Gtk2::Gdk::Pixbuf");
  isa_ok($group -> get_mini_icon(), "Gtk2::Gdk::Pixbuf");
  isa_ok(Gnome2::Wnck::ClassGroup -> get($group -> get_res_class()), "Gnome2::Wnck::ClassGroup");
}
