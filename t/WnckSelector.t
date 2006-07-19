#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/WnckSelector.t,v 1.1 2006/07/19 09:54:45 kaffeetisch Exp $

unless (Gnome2::Wnck -> CHECK_VERSION(2, 10, 0)) {
  plan skip_all => "WnckSelector is new in 2.10";
}

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

my $selector = Gnome2::Wnck::Selector -> new($screen);
isa_ok($selector, "Gtk2::Widget");
