#!/usr/bin/perl -w
use 5.008;
use strict;

use ExtUtils::MakeMaker;
use Cwd;
use File::Spec;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/Makefile.PL,v 1.5 2003/11/26 21:29:32 kaffeetisch Exp $

our %build_reqs = (
  'perl-ExtUtils-Depends'   => '0.1',
  'perl-ExtUtils-PkgConfig' => '0.1',
  'perl-Glib'               => '1.01',
  'perl-Gtk2'               => '1.00',
);

unless (eval "use ExtUtils::Depends;"
           . "use ExtUtils::PkgConfig;"
           # just seeing if Glib is available isn't enough, make sure
           # it's recent enough, too
           . "use Glib '$build_reqs{'perl-Glib'}';"
           . "use Gtk2 '$build_reqs{'perl-Gtk2'}';"
           . "use Glib::MakeHelper;"
           . "use Gtk2::CodeGen;"
           . "1") {
  warn "$@\n";
  WriteMakefile(
    PREREQ_FATAL => 1,
    PREREQ_PM    => {
      'Glib'                => $build_reqs{'perl-Glib'},
      'Gtk2'                => $build_reqs{'perl-Gtk2'},
      'ExtUtils::Depends'   => $build_reqs{'perl-ExtUtils-Depends'},
      'ExtUtils::PkgConfig' => $build_reqs{'perl-ExtUtils-PkgConfig'},
    },
  );
  exit 1; # not reached
}

my %pkgcfg = ExtUtils::PkgConfig->find("libwnck-1.0");

mkdir 'build', 0777;

our @xs_files = <xs/*.xs>;
our %pod_files = (
	'Wnck.pm' => '$(INST_MAN3DIR)/Gnome2::Wnck.$(MAN3EXT)',
	Glib::MakeHelper->do_pod_files (@xs_files),
);

Glib::MakeHelper->do_pod_files (@xs_files);

Gtk2::CodeGen->parse_maps('wnck2perl');
Gtk2::CodeGen->write_boot(ignore => qr/^Gnome2::Wnck$/);

open VERSION, ">build/wnck2perl-version.h";

my $stem = "WNCK";
my @modversion = split /\./, $pkgcfg{ modversion };
print VERSION "#define $stem\_MAJOR_VERSION   ($modversion[0])\n";
print VERSION "#define $stem\_MINOR_VERSION   ($modversion[1])\n";
print VERSION "#define $stem\_MICRO_VERSION   (" . ($modversion[2] || 0) . ")\n";
print VERSION
    "#define $stem\_CHECK_VERSION(major,minor,micro) \\\n"
  . "    ($stem\_MAJOR_VERSION > (major) || \\\n"
  . "     ($stem\_MAJOR_VERSION == (major) && $stem\_MINOR_VERSION > (minor)) || \\\n"
  . "     ($stem\_MAJOR_VERSION == (major) && $stem\_MINOR_VERSION == (minor) && \\\n"
  . "      $stem\_MICRO_VERSION >= (micro)))\n";

close VERSION;

my $wnck = ExtUtils::Depends->new('Gnome2::Wnck', 'Glib', 'Gtk2');
$wnck->set_inc($pkgcfg{cflags} . " -DWNCK_I_KNOW_THIS_IS_UNSTABLE");
$wnck->set_libs($pkgcfg{libs});
$wnck->add_xs(@xs_files);
$wnck->add_pm('Wnck.pm' => '$(INST_LIBDIR)/Wnck.pm');
$wnck->add_typemaps(map {File::Spec->catfile(cwd(), $_)} 'build/wnck2perl.typemap');
$wnck->add_headers('wnck2perl.h');

$wnck->install(qw(wnck2perl.h build/wnck2perl-autogen.h build/wnck2perl-version.h));
$wnck->save_config('build/IFiles.pm');

WriteMakefile(
  NAME          => 'Gnome2::Wnck',
  VERSION_FROM  => 'Wnck.pm', # finds $VERSION
  ABSTRACT_FROM => 'Wnck.pm', # retrieve abstract from module
  XSPROTOARG    => '-noprototypes',
  MAN3PODS      => \%pod_files,
  $wnck->get_makefile_vars,
);

package MY;

sub postamble
{
	return Glib::MakeHelper->postamble_clean ()
	     . Glib::MakeHelper->postamble_docs (@main::xs_files);
}

package MAIN;
