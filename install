<?php
function plugin_version_usersprofile()
{
return array('name' => 'usersprofile',
'version' => '1.0',
'author'=> 'Jeremy POSE',
'license' => 'GPLv2',
'verMinOcs' => '2.2');
}

function plugin_init_usersprofile()
{
	
$object = new plugins;
$object -> add_cd_entry("usersprofile","other");

//table creation
include 'sql/usersprofile.php';

}

function plugin_delete_usersprofile()
{
$object = new plugins;
$object -> del_cd_entry("usersprofile");
}

?>
