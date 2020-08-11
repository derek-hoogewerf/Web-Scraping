#! /usr/bin/perl
use strict;
use warnings;
use Tk;
#-----------------------------------------------------------------Records keeping
my $APP_NAME = "Perl/Tk Text Editor";
my $VERSION = " V0.1";
my $AUTOR = "Mihai Cornel   mhcrnl\@gmail.com";
my $DESCRIPTION = "Text editor application";
my $PERL_VERSION = "v5.24.2"; # $perl -v
my $TK_VERSION = "804.033"; # $perl -MTk -e 'print "$Tk::VERSION\n"'
# ------------------------------------------------------------------MainWindow
my $mw = MainWindow->new(); 
$mw->title($APP_NAME.$VERSION);
$mw->geometry("500x500");
# -------------------------------------------------------------Adding menuBar
$mw ->configure(-menu=>my $menuBar = $mw->Menu);
#------------------------------------------------------------- Adding fileMenu
my $file= $menuBar->cascade(-label=>'~File', -tearoff=>0);
fileMenu();

my $label = $mw -> Label(-text=>"Salut!") -> pack();
my $button = $mw -> Button(-text => "Quit", 
        -command => sub { exit })
    -> pack();
    
MainLoop;

# ----------------------------------------------------------------------------fileMenu                              
sub fileMenu {
    $file->command(-label=>'~New', -accelerator=>'Ctrl+N', -command=>\&new);
    $file->separator;
    $file->command(-label=>'~Open', -accelerator=>'Ctrl+O', -command=>\&load_file);
    $file->command(-label=>'~Save', -accelerator=>'Ctrl+S', -command=>\&save_file);
    $file->separator;
    $file->command(-label=>'~Exit', -accelerator=>'Ctrl+E', -command=>sub {exit;});
}
=pod
    http://bin-co.com/perl/perl_tk_tutorial/perl_tk_tutorial.pdf
=cut