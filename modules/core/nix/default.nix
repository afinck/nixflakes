{ home-manager, pkgs, username, ... }: {
	system = {
		extraSystemBuilderCmds = ''
			ln -sv ${pkgs.path} $out/nixpkgs
		'';
		stateVersion = "24.05";
	};

	# Enabel flakes and nix-commands, enable removing channels
	nix = {
		nixPath = [ "nixpkgs=/run/current-system/nixpkgs" ];
		settings.experimental-features = [ "nix-command" "flakes" ];
	};

	home-manager.users.${username} = {
		# Home.stateVersion has no default and must be set
		home.stateVersion = "24.05";
		nixpkgs.config.allowUnfree = true;
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	programs.direnv = {
		enable = true;
		nix-direnv.enable = true;
	};

	services.devmon.enable = true;
	services.gvfs.enable = true;
	services.udisks2.enable = true;

	networking.hostName = ${hostname};
}
