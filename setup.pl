#!/usr/bin/env perl
use strict;
use warnings;
use Cwd;

my $TOP_DIR             = getcwd;
my $AUTOSTOW_CONFIG_DIR = $ENV{'HOME'} . '/.autostow';
my $CONFIG_FILE         = './autostow.cfg';

&create_autostow_dir($AUTOSTOW_CONFIG_DIR);
&copy_configuration_file( $AUTOSTOW_CONFIG_DIR, $CONFIG_FILE );
&symlink_rcs_templates($AUTOSTOW_CONFIG_DIR);
&symlink_autostow($AUTOSTOW_CONFIG_DIR);

sub symlink_autostow {
    my $autostow_config_dir = shift;

}

# Make symbolic link to revision controlled templates directory
sub symlink_rcs_templates {
    my $autostow_config_dir = shift;
    chdir $autostow_config_dir or die "$!";
    symlink( "$TOP_DIR/templates", "templates" ) or die "$!";
}

sub copy_configuration_file {
    my ( $autostow_config_dir, $config_file ) = @_;
    use File::Copy;
    if ( !-e "$autostow_config_dir/$config_file" ) {
        copy( $config_file, "$autostow_config_dir/$config_file" )
          or die "Copy failed: $!";
    }
}

sub create_autostow_dir {
    my $autostow_config_dir = shift;
    if ( !-e $autostow_config_dir ) {
        mkdir("$autostow_config_dir")
          or die "Unable to create $autostow_config_dir";
    }
}
exit;
