/*
 * Copyright (C) 2003 by the gtk2-perl team
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/xs/WnckWindow.xs,v 1.5 2003/11/26 21:29:37 kaffeetisch Exp $
 */

#include "wnck2perl.h"

MODULE = Gnome2::Wnck::Window	PACKAGE = Gnome2::Wnck::Window	PREFIX = wnck_window_

##  WnckWindow* wnck_window_get (gulong xwindow) 
WnckWindow*
wnck_window_get (class, xwindow)
	gulong xwindow
    C_ARGS:
	xwindow

##  WnckScreen* wnck_window_get_screen (WnckWindow *window) 
WnckScreen*
wnck_window_get_screen (window)
	WnckWindow *window

##  const char* wnck_window_get_name (WnckWindow *window)
const char*
wnck_window_get_name (window)
	WnckWindow *window

##  const char* wnck_window_get_icon_name (WnckWindow *window)
const char*
wnck_window_get_icon_name (window)
	WnckWindow *window

##  WnckApplication* wnck_window_get_application (WnckWindow *window) 
WnckApplication*
wnck_window_get_application (window)
	WnckWindow *window

##  gulong wnck_window_get_group_leader (WnckWindow *window) 
gulong
wnck_window_get_group_leader (window)
	WnckWindow *window

##  gulong wnck_window_get_xid (WnckWindow *window) 
gulong
wnck_window_get_xid (window)
	WnckWindow *window

##  const char* wnck_window_get_session_id (WnckWindow *window)
const char*
wnck_window_get_session_id (window)
	WnckWindow *window

##  const char* wnck_window_get_session_id_utf8 (WnckWindow *window)
const char*
wnck_window_get_session_id_utf8 (window)
	WnckWindow *window

##  int wnck_window_get_pid (WnckWindow *window) 
int
wnck_window_get_pid (window)
	WnckWindow *window

# FIXME: no GType for WnckWindowType.
###  WnckWindowType wnck_window_get_window_type (WnckWindow *window) 
#WnckWindowType
#wnck_window_get_window_type (window)
#	WnckWindow *window

##  gboolean wnck_window_is_minimized (WnckWindow *window) 
gboolean
wnck_window_is_minimized (window)
	WnckWindow *window

##  gboolean wnck_window_is_maximized_horizontally (WnckWindow *window) 
gboolean
wnck_window_is_maximized_horizontally (window)
	WnckWindow *window

##  gboolean wnck_window_is_maximized_vertically (WnckWindow *window) 
gboolean
wnck_window_is_maximized_vertically (window)
	WnckWindow *window

##  gboolean wnck_window_is_maximized (WnckWindow *window) 
gboolean
wnck_window_is_maximized (window)
	WnckWindow *window

##  gboolean wnck_window_is_shaded (WnckWindow *window) 
gboolean
wnck_window_is_shaded (window)
	WnckWindow *window

##  gboolean wnck_window_is_skip_pager (WnckWindow *window) 
gboolean
wnck_window_is_skip_pager (window)
	WnckWindow *window

##  gboolean wnck_window_is_skip_tasklist (WnckWindow *window) 
gboolean
wnck_window_is_skip_tasklist (window)
	WnckWindow *window

##  gboolean wnck_window_is_sticky (WnckWindow *window) 
gboolean
wnck_window_is_sticky (window)
	WnckWindow *window

##  void wnck_window_set_skip_pager (WnckWindow *window, gboolean skip) 
void
wnck_window_set_skip_pager (window, skip)
	WnckWindow *window
	gboolean skip

##  void wnck_window_set_skip_tasklist (WnckWindow *window, gboolean skip) 
void
wnck_window_set_skip_tasklist (window, skip)
	WnckWindow *window
	gboolean skip

##  void wnck_window_close (WnckWindow *window) 
void
wnck_window_close (window)
	WnckWindow *window

##  void wnck_window_minimize (WnckWindow *window) 
void
wnck_window_minimize (window)
	WnckWindow *window

##  void wnck_window_unminimize (WnckWindow *window) 
void
wnck_window_unminimize (window)
	WnckWindow *window

##  void wnck_window_maximize (WnckWindow *window) 
void
wnck_window_maximize (window)
	WnckWindow *window

##  void wnck_window_unmaximize (WnckWindow *window) 
void
wnck_window_unmaximize (window)
	WnckWindow *window

##  void wnck_window_maximize_horizontally (WnckWindow *window) 
void
wnck_window_maximize_horizontally (window)
	WnckWindow *window

##  void wnck_window_unmaximize_horizontally (WnckWindow *window) 
void
wnck_window_unmaximize_horizontally (window)
	WnckWindow *window

##  void wnck_window_maximize_vertically (WnckWindow *window) 
void
wnck_window_maximize_vertically (window)
	WnckWindow *window

##  void wnck_window_unmaximize_vertically (WnckWindow *window) 
void
wnck_window_unmaximize_vertically (window)
	WnckWindow *window

##  void wnck_window_shade (WnckWindow *window) 
void
wnck_window_shade (window)
	WnckWindow *window

##  void wnck_window_unshade (WnckWindow *window) 
void
wnck_window_unshade (window)
	WnckWindow *window

##  void wnck_window_stick (WnckWindow *window) 
void
wnck_window_stick (window)
	WnckWindow *window

##  void wnck_window_unstick (WnckWindow *window) 
void
wnck_window_unstick (window)
	WnckWindow *window

##  void wnck_window_keyboard_move (WnckWindow *window) 
void
wnck_window_keyboard_move (window)
	WnckWindow *window

##  void wnck_window_keyboard_size (WnckWindow *window) 
void
wnck_window_keyboard_size (window)
	WnckWindow *window

##  WnckWorkspace* wnck_window_get_workspace (WnckWindow *window) 
WnckWorkspace*
wnck_window_get_workspace (window)
	WnckWindow *window

##  void wnck_window_move_to_workspace (WnckWindow *window, WnckWorkspace *space) 
void
wnck_window_move_to_workspace (window, space)
	WnckWindow *window
	WnckWorkspace *space

##  gboolean wnck_window_is_pinned (WnckWindow *window) 
gboolean
wnck_window_is_pinned (window)
	WnckWindow *window

##  void wnck_window_pin (WnckWindow *window) 
void
wnck_window_pin (window)
	WnckWindow *window

##  void wnck_window_unpin (WnckWindow *window) 
void
wnck_window_unpin (window)
	WnckWindow *window

##  void wnck_window_activate (WnckWindow *window) 
void
wnck_window_activate (window)
	WnckWindow *window

##  gboolean wnck_window_is_active (WnckWindow *window) 
gboolean
wnck_window_is_active (window)
	WnckWindow *window

#if WNCK_CHECK_VERSION(2,0,0)

##  void wnck_window_activate_transient (WnckWindow *window) 
void
wnck_window_activate_transient (window)
	WnckWindow *window

#endif

##  GdkPixbuf* wnck_window_get_icon (WnckWindow *window) 
GdkPixbuf*
wnck_window_get_icon (window)
	WnckWindow *window

##  GdkPixbuf* wnck_window_get_mini_icon (WnckWindow *window) 
GdkPixbuf*
wnck_window_get_mini_icon (window)
	WnckWindow *window

##  gboolean wnck_window_get_icon_is_fallback (WnckWindow *window) 
gboolean
wnck_window_get_icon_is_fallback (window)
	WnckWindow *window

##  void wnck_window_set_icon_geometry (WnckWindow *window, int x, int y, int width, int height) 
void
wnck_window_set_icon_geometry (window, x, y, width, height)
	WnckWindow *window
	int x
	int y
	int width
	int height

##  WnckWindowActions wnck_window_get_actions (WnckWindow *window) 
WnckWindowActions
wnck_window_get_actions (window)
	WnckWindow *window

##  WnckWindowState wnck_window_get_state (WnckWindow *window) 
WnckWindowState
wnck_window_get_state (window)
	WnckWindow *window

##  void wnck_window_get_geometry (WnckWindow *window, int *xp, int *yp, int *widthp, int *heightp) 
void
wnck_window_get_geometry (WnckWindow *window, OUTLIST int xp, OUTLIST int yp, OUTLIST int widthp, OUTLIST int heightp)

##  gboolean wnck_window_is_visible_on_workspace (WnckWindow *window, WnckWorkspace *workspace) 
gboolean
wnck_window_is_visible_on_workspace (window, workspace)
	WnckWindow *window
	WnckWorkspace *workspace

##  gboolean wnck_window_is_on_workspace (WnckWindow *window, WnckWorkspace *workspace) 
gboolean
wnck_window_is_on_workspace (window, workspace)
	WnckWindow *window
	WnckWorkspace *workspace

#if WNCK_CHECK_VERSION(2, 3, 1)

##  gboolean wnck_window_is_in_viewport (WnckWindow *window, WnckWorkspace *workspace) 
gboolean
wnck_window_is_in_viewport (window, workspace)
	WnckWindow *window
	WnckWorkspace *workspace

#endif

MODULE = Gnome2::Wnck::Window	PACKAGE = Gnome2::Wnck::Window	PREFIX = wnck_

##  GtkWidget* wnck_create_window_action_menu (WnckWindow *window)
GtkWidget*
wnck_create_window_action_menu (window)
	WnckWindow *window
    ALIAS:
	create_action_menu = 0

MODULE = Gnome2::Wnck::Window	PACKAGE = Gnome2::Wnck	PREFIX = wnck_

=for object Gnome2::Wnck::main

=cut

##  GtkWidget* wnck_create_window_menu (GList *windows)
GtkWidget*
wnck_create_window_menu (class, ...)
    PREINIT:
	int i;
	GList *windows = NULL;
    CODE:
	for (i = 1; i < items; i++)
		windows = g_list_append (windows, SvWnckWindow (ST (i)));
	RETVAL = wnck_create_window_menu (windows);
	g_list_free (windows);
    OUTPUT:
	RETVAL
