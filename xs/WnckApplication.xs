#include "wnck2perl.h"

MODULE = Gnome2::Wnck::Application	PACKAGE = Gnome2::Wnck::Application	PREFIX = wnck_application_

##  WnckApplication* wnck_application_get (gulong xwindow) 
WnckApplication*
wnck_application_get (class, xwindow)
	SV *class
	gulong xwindow
    C_ARGS:
	xwindow

##  gulong wnck_application_get_xid (WnckApplication *app) 
gulong
wnck_application_get_xid (app)
	WnckApplication *app

# FIXME: leak?
##  GList* wnck_application_get_windows (WnckApplication *app) 
void
wnck_application_get_windows (app)
	WnckApplication *app
    PREINIT:
	GList *list, *i;
    PPCODE:
	list = wnck_application_get_windows (app);
	for (i = list; i != NULL; i = i->next) {
		XPUSHs (sv_2mortal (newSVWnckWindow (i->data)));
		/* g_free (i->data); */
	}
	/* g_free (list); */

##  int wnck_application_get_n_windows (WnckApplication *app) 
int
wnck_application_get_n_windows (app)
	WnckApplication *app

##  const char* wnck_application_get_name (WnckApplication *app)
const char*
wnck_application_get_name (app)
	WnckApplication *app

##  const char* wnck_application_get_icon_name (WnckApplication *app)
const char*
wnck_application_get_icon_name (app)
	WnckApplication *app

##  int wnck_application_get_pid (WnckApplication *app) 
int
wnck_application_get_pid (app)
	WnckApplication *app

##  GdkPixbuf* wnck_application_get_icon (WnckApplication *app) 
GdkPixbuf*
wnck_application_get_icon (app)
	WnckApplication *app

##  GdkPixbuf* wnck_application_get_mini_icon (WnckApplication *app) 
GdkPixbuf*
wnck_application_get_mini_icon (app)
	WnckApplication *app

##  gboolean wnck_application_get_icon_is_fallback (WnckApplication *app) 
gboolean
wnck_application_get_icon_is_fallback (app)
	WnckApplication *app

##  const char* wnck_application_get_startup_id (WnckApplication *app)
const char*
wnck_application_get_startup_id (app)
	WnckApplication *app
