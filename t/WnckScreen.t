#!/usr/bin/perl -w
use strict;
use Test::More tests => 10;

use Gnome2::Wnck;

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
isa_ok($screen, "Gnome2::Wnck::Screen");

$screen -> force_update();

isa_ok($screen -> get_workspace(0), "Gnome2::Wnck::Workspace");
isa_ok($screen -> get_active_workspace(), "Gnome2::Wnck::Workspace");

SKIP: {
  my $active_window = $screen -> get_active_window();
  skip("no active window found", 1) unless (defined($active_window));
  isa_ok($active_window, "Gnome2::Wnck::Window");
}

isa_ok(($screen -> get_windows())[0], "Gnome2::Wnck::Window");
isa_ok(($screen -> get_windows_stacked())[0], "Gnome2::Wnck::Window");

like($screen -> get_workspace_count(), qr/^\d+$/);
like($screen -> get_background_pixmap(), qr/^\d+$/);
like($screen -> get_width(), qr/^\d+$/);
like($screen -> get_height(), qr/^\d+$/);

# $screen -> change_workspace_count(10);
# $screen -> toggle_showing_desktop(1);
# $screen -> move_viewport(...);
# $screen -> try_set_workspace_layout(...);
# $screen -> release_workspace_layout(...);
# $screen -> net_wm_supports("_NET_WM_PID");
# $screen -> get_showing_desktop();