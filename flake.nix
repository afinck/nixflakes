{
  description = "Andreas flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyrland = { url = "github:hyprwm/hyprland"; };

		hyprlock = {
			url = "github:hyprwm/hyprlock";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprpicker = {
			url = "github:hyprwm/hyprpicker";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

  outputs = { self, nixpkgs, ... }@attrs: 
		let
			supportedSystems = [ "x86_64-linux" ];
			forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
			nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
	  in {

			nixosConfigurations = {

				nixos = let system = "x86_64-linux";
				in nixpkgs.lib.nixosSystem {
					specialArgs = {
						username = "andreas";
						hostname = "mars";
						inherit system;
					} // attrs;
					modules = [ ./.
                        ./hyprland/desktop                    
                     ];
			 	}; 	
		};		
				devShells = forAllSystems (system:
					let pkgs = nixpkgsFor.${system};
					in {
						default = 
							pkgs.mkShell { buildInputs = with pkgs; [ nixfmt-classic statix ]; };
				});

				formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-classic;
  		};
}
