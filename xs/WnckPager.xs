#include "wnck2perl.h"

MODULE = Gnome2::Wnck::Pager	PACKAGE = Gnome2::Wnck::Pager	PREFIX = wnck_pager_

##  GtkWidget* wnck_pager_new (WnckScreen *screen) 
GtkWidget*
wnck_pager_new (class, screen)
	SV *class
	WnckScreen *screen
    C_ARGS:
	screen

##  void wnck_pager_set_screen (WnckPager *pager, WnckScreen *screen) 
void
wnck_pager_set_screen (pager, screen)
	WnckPager *pager
	WnckScreen *screen

##  void wnck_pager_set_orientation (WnckPager *pager, GtkOrientation orientation) 
void
wnck_pager_set_orientation (pager, orientation)
	WnckPager *pager
	GtkOrientation orientation

##  void wnck_pager_set_n_rows (WnckPager *pager, int n_rows) 
void
wnck_pager_set_n_rows (pager, n_rows)
	WnckPager *pager
	int n_rows

# FIXME: no GType for WnckPagerDisplayMode.
###  void wnck_pager_set_display_mode (WnckPager *pager, WnckPagerDisplayMode mode) 
#void
#wnck_pager_set_display_mode (pager, mode)
#	WnckPager *pager
#	WnckPagerDisplayMode mode

##  void wnck_pager_set_show_all (WnckPager *pager, gboolean show_all_workspaces) 
void
wnck_pager_set_show_all (pager, show_all_workspaces)
	WnckPager *pager
	gboolean show_all_workspaces

##  void wnck_pager_set_shadow_type (WnckPager *pager, GtkShadowType shadow_type) 
void
wnck_pager_set_shadow_type (pager, shadow_type)
	WnckPager *pager
	GtkShadowType shadow_type
