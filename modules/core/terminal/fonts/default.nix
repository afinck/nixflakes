{ pkgs, ... }: {
fonts.packages = with pkgs; [
(nerdfonts.override { fonts = [ "JetBrainsMono" "Hack" "MPlus"]; })
	ubuntu_font_family
];
}
