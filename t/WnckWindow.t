#!/usr/bin/perl -w
use strict;
use Test::More;
use Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/t/WnckWindow.t,v 1.17 2005/09/17 20:30:38 kaffeetisch Exp $

unless (Gtk2 -> init_check()) {
  plan skip_all => "Couldn't initialize Gtk2";
}
else {
  Gtk2 -> init();
  plan tests => 42;
}

###############################################################################

my $screen = Gnome2::Wnck::Screen -> get_default();
$screen -> force_update();

###############################################################################

SKIP: {
  my $window = $screen -> get_active_window();
  skip("no active window found", 42) unless (defined($window));

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

  is(Gnome2::Wnck::Window -> get($window -> get_xid()), $window);

  # ok($window -> get_session_id());
  # ok($window -> get_session_id_utf8());

  if (Gnome2::Wnck -> CHECK_VERSION(2, 10, 0)) {
    $window -> activate(time());
    $window -> activate_transient(time());
  }
  elsif (Gnome2::Wnck -> CHECK_VERSION(2, 0, 0)) {
    $window -> activate();
    $window -> activate_transient();
  }

  SKIP: {
    skip("windowmanager doesn't appear to support workspaces", 3)
      unless ($have_workspaces);

    ok($window -> is_on_workspace($window -> get_workspace()));
    ok($window -> is_visible_on_workspace($window -> get_workspace()));

    skip("is_in_viewport is new in 2.4.0", 1)
    unless (Gnome2::Wnck -> CHECK_VERSION(2, 4, 0));

    ok($window -> is_in_viewport($window -> get_workspace()));
  }

  SKIP: {
    skip("get_class_group is new in 2.6.0", 1)
      unless (Gnome2::Wnck -> CHECK_VERSION(2, 6, 0));

    isa_ok($window -> get_class_group(), "Gnome2::Wnck::ClassGroup");
  }

  SKIP: {
    skip("get_class_group is new in 2.8", 1)
      unless (Gnome2::Wnck -> CHECK_VERSION(2, 8, 0));

    ok(defined($window -> get_window_type()));
  }

  my $number = qr/^\d+$/;
  my $boolean = qr/^(|1)$/;

  SKIP: {
    skip("new 2.12 stuff", 4)
      unless (Gnome2::Wnck -> CHECK_VERSION(2, 12, 0));

    $window -> set_window_type("normal");

    my $transient = $window -> get_transient();
    ok(not defined $transient || ref $transient eq "Gnome2::Wnck::Window");

    like($window -> needs_attention(), $boolean);
    like($window -> or_transient_needs_attention(), $boolean);
    like($window -> transient_is_most_recently_activated(), $boolean);
  }

  SKIP: {
    skip("get_class_group is new in 2.10", 1)
      unless (Gnome2::Wnck -> CHECK_VERSION(2, 10, 0));

    like($window -> get_sort_order(), $number);
  }

  my ($x, $y, $width, $height) = $window -> get_geometry();

  like($x, $number);
  like($y, $number);
  like($width, $number);
  like($height, $number);

  $window -> set_icon_geometry(10, 10, 100, 100);

  like($window -> is_minimized(), $boolean);
  like($window -> is_maximized_horizontally(), $boolean);
  like($window -> is_maximized_vertically(), $boolean);
  like($window -> is_maximized(), $boolean);
  like($window -> is_shaded(), $boolean);
  like($window -> is_skip_pager(), $boolean);
  like($window -> is_skip_tasklist(), $boolean);
  like($window -> is_sticky(), $boolean);
  like($window -> is_pinned(), $boolean);
  like($window -> is_active(), $boolean);

  SKIP: {
    skip("is_fullscreen, set_fullscreen, demands_attention and is_most_recently_activated are new in 2.8", 2)
      unless (Gnome2::Wnck -> CHECK_VERSION(2, 8, 0));

    like($window -> is_fullscreen(), $boolean);
    $window -> set_fullscreen($window -> is_fullscreen());

    like($window -> is_most_recently_activated(), $boolean);
  }

  $window -> set_skip_pager($window -> is_skip_pager());
  $window -> set_skip_tasklist($window -> is_skip_tasklist());

  like($window -> get_icon_is_fallback(), $boolean);
  isa_ok($window -> get_actions(), "Gnome2::Wnck::WindowActions");
  isa_ok($window -> get_state(), "Gnome2::Wnck::WindowState");

  # $window -> minimize();
  # $window -> unminimize();
  # $window -> maximize();
  # $window -> unmaximize();
  # $window -> maximize_horizontally();
  # $window -> unmaximize_horizontally();
  # $window -> maximize_vertically();
  # $window -> unmaximize_vertically();
  # $window -> shade();
  # $window -> unshade();
  # $window -> stick();
  # $window -> unstick();
  # $window -> pin();
  # $window -> unpin();

  # $window -> move_to_workspace(...);
  # $window -> close();
  # $window -> keyboard_move();
  # $window -> keyboard_size();
}
