#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/WnckWindow.t,v 1.10 2004/04/20 15:25:11 kaffeetisch Exp $

unless (Gtk2 -> init_check()) {
  plan skip_all => "Couldn't initialize Gtk2";
}
else {
  Gtk2 -> init();
  plan tests => 22;
}

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

SKIP: {
  my $window = $screen -> get_active_window();
  skip("no active window found", 22) unless (defined($window));

  my $workspace = $window -> get_workspace();
  my $have_workspaces = defined $workspace;

  SKIP: {
    skip("windowmanager doesn't appear to support workspaces", 1)
      unless ($have_workspaces);
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

  if (Gnome2::Wnck -> CHECK_VERSION(2, 0, 0)) {
    $window -> activate_transient();
  }

  SKIP: {
    skip("windowmanager doesn't appear to support workspaces", 2)
      unless ($have_workspaces);
    ok($window -> is_on_workspace($window -> get_workspace()));

    skip("is_in_viewport is new in 2.4.0", 1)
    unless (Gnome2::Wnck -> CHECK_VERSION(2, 4, 0));

    ok($window -> is_in_viewport($window -> get_workspace()));
  }

  SKIP: {
    skip("get_class_group is new in 2.6.0", 1)
      unless (Gnome2::Wnck -> CHECK_VERSION(2, 6, 0));

    isa_ok($window -> get_class_group(), "Gnome2::Wnck::ClassGroup");
  }

  my ($x, $y, $width, $height) = $window -> get_geometry();

  like($x, qr/^\d+$/);
  like($y, qr/^\d+$/);
  like($width, qr/^\d+$/);
  like($height, qr/^\d+$/);

  $window -> set_icon_geometry(10, 10, 100, 100);

  # $window -> is_*();
  # $window -> set_skip_*(...);
  # $window -> *();
  # $window -> move_to_workspace(...);

  like($window -> get_icon_is_fallback(), qr/^(|1)$/);
  isa_ok($window -> get_actions(), "Gnome2::Wnck::WindowActions");
  isa_ok($window -> get_state(), "Gnome2::Wnck::WindowState");
}
