#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/WnckPager.t,v 1.5 2004/02/16 16:14:31 kaffeetisch Exp $

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

if (Gnome2::Wnck -> check_version(2, 0, 0)) {
  $pager -> set_screen($screen);
  $pager -> set_shadow_type("etched-in");
}

$pager -> set_orientation("vertical");
$pager -> set_n_rows(3);
$pager -> set_show_all(1);
