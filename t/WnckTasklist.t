#!/usr/bin/perl -w
use strict;
use Test::More tests => 2;

use Gtk2 -init;
use Gnome2::Wnck;

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

my $tasklist = Gnome2::Wnck::Tasklist -> new($screen);

$tasklist -> set_screen($screen);
$tasklist -> set_switch_workspace_on_unminimize(1);
$tasklist -> set_grouping_limit(5);
$tasklist -> set_include_all_workspaces(0);

$tasklist -> set_minimum_width(50);
is($tasklist -> get_minimum_width(), 50);

$tasklist -> set_minimum_height(20);
is($tasklist -> get_minimum_height(), 20);

# $tasklist -> set_icon_loader(sub {
#   my ($icon_name, $size, $flags) = @_;

#   warn join(", ", ($icon_name, $size, $flags));
#   warn join(", ", $tasklist -> get_size_hint_list());

#   return Gtk2::Gdk::Pixbuf -> new();
# });
