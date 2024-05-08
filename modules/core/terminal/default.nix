{ pkgs, home-manager, username, ... }: {
	imports = [ ./bash ./fonts ./vim ./git ];

	# --- Home Configuration ---
	home-manager.users.${username} = {
		programs.git.enable = true;
	};

	# --- System Configuration ---
	programs = {
		htop.enable = true;
	};

	environment.systemPackages = with pkgs; [
		nitch
		foot
		brightnessctl
		btop
		gh
		ripgrep
		unzip
		wget
		curl
		netcat
		dig
		ffmpegthumbnailer
		unar
		poppler
		fd
		fzf
		zoxide
		glow
		zathura
		vim
	];
}
