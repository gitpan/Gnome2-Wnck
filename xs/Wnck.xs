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
 * $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/xs/Wnck.xs,v 1.7 2004/03/03 19:33:30 kaffeetisch Exp $
 */

#include "wnck2perl.h"

MODULE = Gnome2::Wnck	PACKAGE = Gtk2::Window	PREFIX = wnck_gtk_window_

# keep this doc from clobbering Gtk2::Window 
=for object Gnome2::Wnck::main
=cut

##  void wnck_gtk_window_set_dock_type (GtkWindow *window)
void
wnck_gtk_window_set_dock_type (window)
	GtkWindow *window

MODULE = Gnome2::Wnck	PACKAGE = Gnome2::Wnck

=for object Gnome2::Wnck::main

=cut

BOOT:
#include "register.xsh"
#include "boot.xsh"

void
GET_VERSION_INFO (class)
    PPCODE:
	EXTEND (SP, 3);
	PUSHs (sv_2mortal (newSViv (WNCK_MAJOR_VERSION)));
	PUSHs (sv_2mortal (newSViv (WNCK_MINOR_VERSION)));
	PUSHs (sv_2mortal (newSViv (WNCK_MICRO_VERSION)));
	PERL_UNUSED_VAR (ax);

bool
CHECK_VERSION (class, major, minor, micro)
	int major
	int minor
	int micro
    CODE:
	RETVAL = WNCK_CHECK_VERSION (major, minor, micro);
    OUTPUT:
	RETVAL
