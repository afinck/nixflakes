{
	# set timezone
	time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";
  console = {
     keyMap = "de";
  };
	services.xserver = {
		xkb.layout = "de";
		xkb.variant = "eurosign:e,caps:escape";
	};
}
