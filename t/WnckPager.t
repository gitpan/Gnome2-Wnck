#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/WnckPager.t,v 1.7 2004/08/10 18:17:13 kaffeetisch Exp $

unless (Gtk2 -> init_check()) {
  plan skip_all => "Couldn't initialize Gtk2";
}
else {
  Gtk2 -> init();
  plan tests => 1;
}

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

my $pager = Gnome2::Wnck::Pager -> new($screen);
isa_ok($pager, "Gnome2::Wnck::Pager");

if (Gnome2::Wnck -> CHECK_VERSION(2, 0, 0)) {
  $pager -> set_screen($screen);
  $pager -> set_shadow_type("etched-in");
}

if (Gnome2::Wnck -> CHECK_VERSION(2, 7, 91)) { # FIXME: 2.8
  $pager -> set_display_mode("content");
}

$pager -> set_orientation("vertical");
$pager -> set_n_rows(3);
$pager -> set_show_all(1);
