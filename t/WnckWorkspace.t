#!/usr/bin/perl -w
use strict;
use Test::More tests => 2;

use Gtk2 -init;
use Gnome2::Wnck;

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

my $workspace = $screen -> get_workspace(0);

is($workspace -> get_number(), 0);
is($workspace -> get_name(), "Workspace 1");
# like($workspace -> get_width(), qr/^\d+$/);
# like($workspace -> get_height(), qr/^\d+$/);
# like($workspace -> get_viewport_x(), qr/^\d+$/);
# like($workspace -> get_viewport_y(), qr/^\d+$/);
# ok(not $workspace -> is_virtual());
$screen -> get_active_workspace() -> activate();

# $workspace -> change_name(...);
