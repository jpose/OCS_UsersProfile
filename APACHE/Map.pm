# Author: Jérémy POSE
# v1.0 / 11/08/2016

package Apache::Ocsinventory::Plugins::Usersprofile::Map;
 
use strict;
 
use Apache::Ocsinventory::Map;
#Plugin USERSPROFILE
$DATA_MAP{usersprofile} = {
		mask => 0,
		multi => 1,
		auto => 1,
		delOnReplace => 1,
		sortBy => 'PROFILENAME',
		writeDiff => 0,
		cache => 0,
		fields => {
                        PROFILENAME => {},
                        PROFILESIZE => {},
	}
};
1;
