/*
 * Copyright (C) 2003 by the gtk2-perl team (see the file AUTHORS)
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
 * $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/wnck2perl.h,v 1.5 2005/02/24 18:15:37 kaffeetisch Exp $
 */

#ifndef _WNCK2PERL_H_
#define _WNCK2PERL_H_

#include <gtk2perl.h>

#include <libwnck/libwnck.h>
#include <libwnck/window-action-menu.h>

#include "wnck2perl-version.h"

#if !WNCK_CHECK_VERSION (2, 9, 91) /* FIXME: 2.10 */
# include <libwnck/window-menu.h>
#endif

#if WNCK_CHECK_VERSION (2, 6, 0)
# include <libwnck/class-group.h>
#endif

#include "wnck2perl-autogen.h"

#endif /* _WNCK2PERL_H_ */
