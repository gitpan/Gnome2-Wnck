#include "wnck2perl.h"

MODULE = Gnome2::Wnck::Screen	PACKAGE = Gnome2::Wnck::Screen	PREFIX = wnck_screen_

##  WnckScreen* wnck_screen_get_default (void) 
WnckScreen*
wnck_screen_get_default (class)
	SV *class
    C_ARGS:
	/* void */

##  WnckScreen* wnck_screen_get (int index) 
WnckScreen*
wnck_screen_get (class, index)
	SV *class
	int index
    C_ARGS:
	index

##  WnckScreen* wnck_screen_get_for_root (gulong root_window_id) 
WnckScreen*
wnck_screen_get_for_root (class, root_window_id)
	SV *class
	gulong root_window_id
    C_ARGS:
	root_window_id

##  WnckWorkspace* wnck_screen_get_workspace (WnckScreen *screen, int workspace) 
WnckWorkspace*
wnck_screen_get_workspace (screen, workspace)
	WnckScreen *screen
	int workspace

##  WnckWorkspace* wnck_screen_get_active_workspace (WnckScreen *screen) 
WnckWorkspace*
wnck_screen_get_active_workspace (screen)
	WnckScreen *screen

##  WnckWindow* wnck_screen_get_active_window (WnckScreen *screen) 
WnckWindow*
wnck_screen_get_active_window (screen)
	WnckScreen *screen

# FIXME: leaks?
##  GList* wnck_screen_get_windows (WnckScreen *screen) 
void
wnck_screen_get_windows (screen)
	WnckScreen *screen
    PREINIT:
	GList *list, *i;
    PPCODE:
	list = wnck_screen_get_windows (screen);
	for (i = list; i != NULL; i = i->next) {
		XPUSHs (sv_2mortal (newSVWnckWindow (i->data)));
		/* g_free (i->data); */
	}
	/* g_free (list); */

# FIXME: leaks?
##  GList* wnck_screen_get_windows_stacked (WnckScreen *screen) 
void
wnck_screen_get_windows_stacked (screen)
	WnckScreen *screen
    PREINIT:
	GList *list, *i;
    PPCODE:
	list = wnck_screen_get_windows_stacked (screen);
	for (i = list; i != NULL; i = i->next) {
		XPUSHs (sv_2mortal (newSVWnckWindow (i->data)));
		/* g_free (i->data); */
	}
	/* g_free (list); */

##  void wnck_screen_force_update (WnckScreen *screen) 
void
wnck_screen_force_update (screen)
	WnckScreen *screen

##  int wnck_screen_get_workspace_count (WnckScreen *screen) 
int
wnck_screen_get_workspace_count (screen)
	WnckScreen *screen

##  void wnck_screen_change_workspace_count (WnckScreen *screen, int count) 
void
wnck_screen_change_workspace_count (screen, count)
	WnckScreen *screen
	int count

##  gboolean wnck_screen_net_wm_supports (WnckScreen *screen, const char *atom) 
gboolean
wnck_screen_net_wm_supports (screen, atom)
	WnckScreen *screen
	const char *atom

##  gulong wnck_screen_get_background_pixmap (WnckScreen *screen) 
gulong
wnck_screen_get_background_pixmap (screen)
	WnckScreen *screen

##  int wnck_screen_get_width (WnckScreen *screen) 
int
wnck_screen_get_width (screen)
	WnckScreen *screen

##  int wnck_screen_get_height (WnckScreen *screen) 
int
wnck_screen_get_height (screen)
	WnckScreen *screen

##  gboolean wnck_screen_get_showing_desktop (WnckScreen *screen) 
gboolean
wnck_screen_get_showing_desktop (screen)
	WnckScreen *screen

##  void wnck_screen_toggle_showing_desktop (WnckScreen *screen, gboolean show) 
void
wnck_screen_toggle_showing_desktop (screen, show)
	WnckScreen *screen
	gboolean show

# FIXME: in what version did this function first appear?
###  void wnck_screen_move_viewport (WnckScreen *screen, int x, int y) 
#void
#wnck_screen_move_viewport (screen, x, y)
#	WnckScreen *screen
#	int x
#	int y

##  int wnck_screen_try_set_workspace_layout (WnckScreen *screen, int current_token, int rows, int columns) 
int
wnck_screen_try_set_workspace_layout (screen, current_token, rows, columns)
	WnckScreen *screen
	int current_token
	int rows
	int columns

##  void wnck_screen_release_workspace_layout (WnckScreen *screen, int current_token) 
void
wnck_screen_release_workspace_layout (screen, current_token)
	WnckScreen *screen
	int current_token
