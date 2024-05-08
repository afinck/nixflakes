{ pkgs, username, ... }:
{
	# Set a user name. Don't forget to set the password for this user
	users.users.andreas = {
		shell = pkgs.bash;
		isNormalUser = true;
		initialPassword = "abc123";
		extraGroups = [ "wheel" "input" "video" ];
	};
}
