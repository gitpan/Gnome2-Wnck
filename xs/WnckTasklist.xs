#include "wnck2perl.h"

static GPerlCallback *
wnck2perl_load_icon_function_create (SV *func, SV *data)
{
	GType param_types [] = {
		G_TYPE_STRING,
		G_TYPE_INT,
		G_TYPE_UINT
	};
	return gperl_callback_new (func, data, G_N_ELEMENTS (param_types),
				   param_types, GDK_TYPE_PIXBUF);
}

GdkPixbuf*
wnck2perl_load_icon_function (const char *icon_name,
                              int size,
                              unsigned int flags,
                              gpointer data)
{
	GPerlCallback *callback = (GPerlCallback*) data;
	GValue value = {0,};
	GdkPixbuf* retval;

	g_value_init (&value, callback->return_type);
	gperl_callback_invoke (callback, &value, icon_name, size, flags);
	retval = g_value_get_object (&value);
	g_value_unset (&value);

	return retval;
}

MODULE = Gnome2::Wnck::Tasklist	PACKAGE = Gnome2::Wnck::Tasklist	PREFIX = wnck_tasklist_

##  GtkWidget *wnck_tasklist_new (WnckScreen *screen) 
GtkWidget *
wnck_tasklist_new (class, screen)
	SV *class
	WnckScreen *screen
    C_ARGS:
	screen

##  void wnck_tasklist_set_screen (WnckTasklist *tasklist, WnckScreen *screen) 
void
wnck_tasklist_set_screen (tasklist, screen)
	WnckTasklist *tasklist
	WnckScreen *screen

##  const int *wnck_tasklist_get_size_hint_list (WnckTasklist *tasklist, int *n_elements)
void
wnck_tasklist_get_size_hint_list (tasklist)
	WnckTasklist *tasklist
    PREINIT:
	const int *list;
	int n_elements, i;
    PPCODE:
	list = wnck_tasklist_get_size_hint_list (tasklist, &n_elements);

	EXTEND (sp, n_elements);

	for (i = 0; i < n_elements; i++)
		PUSHs (sv_2mortal (newSViv (list[i])));

# FIXME: no GType for WnckTasklistGroupingType.
###  void wnck_tasklist_set_grouping (WnckTasklist *tasklist, WnckTasklistGroupingType grouping) 
#void
#wnck_tasklist_set_grouping (tasklist, grouping)
#	WnckTasklist *tasklist
#	WnckTasklistGroupingType grouping

##  void wnck_tasklist_set_switch_workspace_on_unminimize (WnckTasklist *tasklist, gboolean switch_workspace_on_unminimize) 
void
wnck_tasklist_set_switch_workspace_on_unminimize (tasklist, switch_workspace_on_unminimize)
	WnckTasklist *tasklist
	gboolean switch_workspace_on_unminimize

##  void wnck_tasklist_set_grouping_limit (WnckTasklist *tasklist, gint limit) 
void
wnck_tasklist_set_grouping_limit (tasklist, limit)
	WnckTasklist *tasklist
	gint limit

##  void wnck_tasklist_set_include_all_workspaces (WnckTasklist *tasklist, gboolean include_all_workspaces) 
void
wnck_tasklist_set_include_all_workspaces (tasklist, include_all_workspaces)
	WnckTasklist *tasklist
	gboolean include_all_workspaces

##  void wnck_tasklist_set_minimum_width (WnckTasklist *tasklist, gint size) 
void
wnck_tasklist_set_minimum_width (tasklist, size)
	WnckTasklist *tasklist
	gint size

##  gint wnck_tasklist_get_minimum_width (WnckTasklist *tasklist) 
gint
wnck_tasklist_get_minimum_width (tasklist)
	WnckTasklist *tasklist

##  void wnck_tasklist_set_minimum_height (WnckTasklist *tasklist, gint size) 
void
wnck_tasklist_set_minimum_height (tasklist, size)
	WnckTasklist *tasklist
	gint size

##  gint wnck_tasklist_get_minimum_height (WnckTasklist *tasklist) 
gint
wnck_tasklist_get_minimum_height (tasklist)
	WnckTasklist *tasklist

##  void wnck_tasklist_set_icon_loader (WnckTasklist *tasklist, WnckLoadIconFunction load_icon_func, void *data, GDestroyNotify free_data_func) 
void
wnck_tasklist_set_icon_loader (tasklist, func, data=NULL)
	WnckTasklist *tasklist
	SV *func
	SV *data
    PREINIT:
	GPerlCallback *callback;
    CODE:
	callback = wnck2perl_load_icon_function_create (func, data);
	wnck_tasklist_set_icon_loader (tasklist,
	                               wnck2perl_load_icon_function,
	                               callback,
	                               (GDestroyNotify) gperl_callback_destroy);
