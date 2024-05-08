{ pkgs, home-manager, username, ... }:

{
	programs = {
		command-not-found.enable = false;

		# Add bash aliases
		bash = {
			interactiveShellInit = ''
				nitch
			'';
			shellAliases = {
				ls =					"ls --color";
				grep = 				"grep --color=auto";
				cp =					"cp -ia";
				ll = 					"ls -la";
				c = 					"clear";
				e =						"exit";
				d = 					"cd ~/Dokumente";
				D = 					"cd ~/Downloads";
				gs =					"git status";
				ga = 					"git add";
				gc = 					"git commit -m";
				gf = 					"git fetch";
				gp	= 				"git push";
			};
		};
	};
}
