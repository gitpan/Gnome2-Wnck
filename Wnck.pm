package Gnome2::Wnck;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/Wnck.pm,v 1.3 2003/11/28 21:39:14 kaffeetisch Exp $

use 5.008;
use strict;
use warnings;

use Gtk2 -init;

require DynaLoader;

our @ISA = qw(DynaLoader);

our $VERSION = '0.02';

sub dl_load_flags { 0x01 }

Gnome2::Wnck -> bootstrap($VERSION);

1;
__END__

=head1 NAME

Gnome2::Wnck - Perl interface to the Window Navigator Construction Kit

=head1 SYNOPSIS

  use Gnome2::Wnck;

  my $screen = Gnome2::Wnck::Screen -> get_default();
  $screen -> force_update();

  my $pager = Gnome2::Wnck::Pager -> new($screen);
  my $tasklist = Gnome2::Wnck::Tasklist -> new($screen);

=head1 ABSTRACT

This module allows a Perl developer to use the Window Navigator Construction
Kit library (libwnck for short) to write tasklists and pagers.

=head1 SEE ALSO

L<Gtk2>, L<Gtk2::api> and the source code of libwnck.

=head1 AUTHOR

Torsten Schoenfeld E<lt>kaffeetisch@web.deE<gt>

=cut
