#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/WnckWindow.t,v 1.8 2004/02/16 16:14:31 kaffeetisch Exp $

unless (Gtk2 -> init_check()) {
  plan skip_all => "Couldn't initialize Gtk2";
}
else {
  Gtk2 -> init();
  plan tests => 18;
}

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

SKIP: {
  my $window = $screen -> get_active_window();
  skip("no active window found", 18) unless (defined($window));

  my $workspace = $window -> get_workspace();
  my $have_workspaces = defined $workspace;
  SKIP: {
    skip("windowmanager doesn't appear to support workspaces", 1)
      unless $have_workspaces;
    isa_ok($workspace, "Gnome2::Wnck::Workspace");
  }

  isa_ok($window -> get_application(), "Gnome2::Wnck::Application");
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
  # ok($window -> get_session_id());
  # ok($window -> get_session_id_utf8());
  SKIP: {
    skip("windowmanager doesn't appear to support workspaces", 2)
      unless $have_workspaces;
    ok($window -> is_on_workspace($window -> get_workspace()));

    skip("is_in_viewport is new in 2.3.1", 1)
    unless (Gnome2::Wnck -> check_version(2, 3, 1));

    ok($window -> is_in_viewport($window -> get_workspace()));
  }

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
}
