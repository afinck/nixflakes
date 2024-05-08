{ pkgs, home-manager, username, ... }: {
	programs.git = {
		enable = true;
		config = {
			user.name = "Andreas Finck";
			user.email = "andreas.finck@icloud.com";
		};
	};
}
