#!/usr/bin/perl -w
use 5.008;
use strict;

use ExtUtils::MakeMaker;
use Cwd;
use File::Spec;

# $Header: /cvsroot/gtk2-perl/gtk2-perl-xs/Gnome2-Wnck/Makefile.PL,v 1.1 2003/10/11 18:39:07 kaffeetisch Exp $

our %build_reqs = (
  'perl-ExtUtils-Depends'   => '0.1',
  'perl-ExtUtils-PkgConfig' => '0.1',
  'perl-Glib'               => '1.00rc1',
  'perl-Gtk2'               => '1.00rc1',
  'Wnck'                    => '2.0.0',
);

unless (eval "use ExtUtils::Depends;"
           . "use ExtUtils::PkgConfig;"
           . "use Gtk2::CodeGen;"
           # just seeing if Glib is available isn't enough, make sure
           # it's recent enough, too
           . "use Glib '$build_reqs{'perl-Glib'}';"
           . "use Gtk2 '$build_reqs{'perl-Gtk2'}';"
           . "1") {
  warn "$@\n";
  WriteMakefile(
    PREREQ_FATAL => 1,
    PREREQ_PM    => {
      'Glib::'                => $build_reqs{'perl-Glib'},
      'Gtk2::'                => $build_reqs{'perl-Gtk2'},
      'ExtUtils::Depends::'   => $build_reqs{'perl-ExtUtils-Depends'},
      'ExtUtils::PkgConfig::' => $build_reqs{'perl-ExtUtils-PkgConfig'},
    },
  );
  exit 1; # not reached
}

my %pkgcfg = ExtUtils::PkgConfig->find("libwnck-1.0 >= $build_reqs{'Wnck'}");

mkdir 'build', 0777;

Gtk2::CodeGen->parse_maps('wnck2perl');
Gtk2::CodeGen->write_boot(ignore => qr/^Gnome2::Wnck$/);

my $wnck = ExtUtils::Depends->new('Gnome2::Wnck', 'Glib', 'Gtk2');
$wnck->set_inc($pkgcfg{cflags} . " -DWNCK_I_KNOW_THIS_IS_UNSTABLE");
$wnck->set_libs($pkgcfg{libs});
$wnck->add_xs(<xs/*.xs>);
$wnck->add_pm('Wnck.pm' => '$(INST_LIBDIR)/Wnck.pm');
$wnck->add_typemaps(map {File::Spec->catfile(cwd(), $_)} 'build/wnck2perl.typemap');
$wnck->add_headers('wnck2perl.h');

$wnck->install(qw(wnck2perl.h build/wnck2perl-autogen.h));
$wnck->save_config('build/IFiles.pm');

WriteMakefile(
  NAME          => 'Gnome2::Wnck',
  VERSION_FROM  => 'Wnck.pm', # finds $VERSION
  ABSTRACT_FROM => 'Wnck.pm', # retrieve abstract from module
  XSPROTOARG    => '-noprototypes',
  $wnck->get_makefile_vars,
);

# there's a bug in the MakeMaker output which results in .xs files in a
# subdirectory being turned into .o files in this dir.  the bug is a missing
# -o on the compiler command line.  this is a hackish fix for it.
package MY;

sub const_cccmd {
	my $inherited = shift->SUPER::const_cccmd (@_);
	$inherited .= ' -o $@';
	$inherited;
}

sub postamble {
	"
realclean ::
	-rm -Rf build
"
}

package MAIN;
