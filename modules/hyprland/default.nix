{ hyprland, hyprpicker, pkgs, username, home-manager, system, ... }: {
  imports = [
    hyprland.nixosModules.default
    ./config
    #./hyprlock
    ./mako
    ./swaylock
    ./waybar
    ./wofi
    ./greetd
  ];

  home-manager.users.${username} = _: {
    gtk.enable = true;
    gtk.cursorTheme.name = "Adwaita";
    gtk.cursorTheme.package = pkgs.gnome.adwaita-icon-theme;
    gtk.theme.name = "adw-gtk3-dark";
    gtk.theme.package = pkgs.adw-gtk3;
  };

  environment = {
    sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      grim
      swww
      hyprpaper
      hyprpicker.packages.${system}.default
      lxqt.lxqt-policykit
      slurp
      wl-clipboard
      # Required if applications are having trouble opening links
      xdg-utils
      xfce.thunar
      xfce.tumbler
    ];
  };

  programs.hyprland.enable = true;
  sound.enable = true;
  sound.mediaKeys.enable = true;
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 224 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/brightnessctl set 5%- -d intel_backlight"; }
      { keys = [ 225 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/brightnessctl set 5%+ -d intel_backlight"; }
      { keys = [ 113 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle"; }
      { keys = [ 190 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/pactl set-source-mute 0 toggle"; }
      { keys = [ 114 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/pactl set-sink-volume @DEFAULT_SINK@ -2%"; }
      { keys = [ 115 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/pactl set-sink-volume @DEFAULT_SINK@ +2%"; }
    ];
  };

  programs.dconf.enable = true;

  services.gnome = { gnome-keyring.enable = true; };

  security.pam.services.login.enableGnomeKeyring = true;

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "xdph" "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.portal.FileChooser" = [ "xdg-desktop-portal-gtk" ];
      };
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}

