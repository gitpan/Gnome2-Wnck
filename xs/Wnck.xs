#include "wnck2perl.h"

MODULE = Gnome2::Wnck	PACKAGE = Gtk2::Window	PREFIX = wnck_gtk_window_
 
##  void wnck_gtk_window_set_dock_type (GtkWindow *window)
void
wnck_gtk_window_set_dock_type (window)
	GtkWindow *window

MODULE = Gnome2::Wnck	PACKAGE = Gnome2::Wnck

BOOT:
#include "register.xsh"
#include "boot.xsh"
