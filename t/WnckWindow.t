#!/usr/bin/perl -w
use strict;
use Test::More tests => 19;

use Gtk2 -init;
use Gnome2::Wnck;

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

my $window = $screen -> get_active_window();

isa_ok($window -> get_application(), "Gnome2::Wnck::Application");
isa_ok($window -> get_workspace(), "Gnome2::Wnck::Workspace");
isa_ok($window -> get_icon(), "Gtk2::Gdk::Pixbuf");
isa_ok($window -> get_mini_icon(), "Gtk2::Gdk::Pixbuf");

isa_ok($window -> create_window_action_menu(), "Gtk2::Menu");
isa_ok($window -> create_action_menu(), "Gtk2::Menu");

is($window -> get_screen(), $screen);
ok($window -> get_name());
ok($window -> get_icon_name());
like($window -> get_group_leader(), qr/^\d+$/);
like($window -> get_xid(), qr/^\d+$/);
like($window -> get_pid(), qr/^\d+$/);
ok($window -> get_session_id());
ok($window -> get_session_id_utf8());
ok($window -> is_on_workspace($window -> get_workspace()));
# ok($window -> is_in_viewport($window -> get_workspace()));

my ($x, $y, $width, $height) = $window -> get_geometry();

like($x, qr/^\d+$/);
like($y, qr/^\d+$/);
like($width, qr/^\d+$/);
like($height, qr/^\d+$/);

# $window -> is_*();
# $window -> set_skip_*(...);
# $window -> *();
# $window -> move_to_workspace(...);
# $window -> get_icon_is_fallback();
# $window -> set_icon_geometry(...);
# warn @{$window -> get_actions()};
# warn @{$window -> get_state()};
