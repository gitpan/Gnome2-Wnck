#include "wnck2perl.h"

MODULE = Gnome2::Wnck::Workspace	PACKAGE = Gnome2::Wnck::Workspace	PREFIX = wnck_workspace_

##  int wnck_workspace_get_number (WnckWorkspace *space) 
int
wnck_workspace_get_number (space)
	WnckWorkspace *space

##  const char* wnck_workspace_get_name (WnckWorkspace *space)
const char*
wnck_workspace_get_name (space)
	WnckWorkspace *space

##  void wnck_workspace_change_name (WnckWorkspace *space, const char *name) 
void
wnck_workspace_change_name (space, name)
	WnckWorkspace *space
	const char *name

##  void wnck_workspace_activate (WnckWorkspace *space) 
void
wnck_workspace_activate (space)
	WnckWorkspace *space

# FIXME: what version introduced these five?
###  int wnck_workspace_get_width (WnckWorkspace *space) 
#int
#wnck_workspace_get_width (space)
#	WnckWorkspace *space

###  int wnck_workspace_get_height (WnckWorkspace *space) 
#int
#wnck_workspace_get_height (space)
#	WnckWorkspace *space

###  int wnck_workspace_get_viewport_x (WnckWorkspace *space) 
#int
#wnck_workspace_get_viewport_x (space)
#	WnckWorkspace *space

###  int wnck_workspace_get_viewport_y (WnckWorkspace *space) 
#int
#wnck_workspace_get_viewport_y (space)
#	WnckWorkspace *space

###  gboolean wnck_workspace_is_virtual (WnckWorkspace *space) 
#gboolean
#wnck_workspace_is_virtual (space)
#	WnckWorkspace *space
