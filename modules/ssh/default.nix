{ username, ... }: {
	users.users.${username} = {
		openssh.authorizedKeys.keys = [
			"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCoo9Iq9tUQGF90vOXnrtRhenF6WUdk1vouPKzvO6VlnNwyeSD63Rre1RX/LAyPRBy+/mqwvplTsg6c4Wb4ARcqQh0oN1oNJq0MFpXiG4ElcKNyaVJgm924CZJrYMZL1w7qBaBiYkeoBmQunOVCzeRLnLp5Ti5ANqmCxbSX56QQ91ugp2e4epT66+ET86w9arRPp2y9lVJctQbLgnhy4TJpvWDFkEsXgNcqRwnRqgyLh8s8P1mypohqJB7lIBk92O9jl0lFh0TWUG/Y2EP7gw7u0hPS9gz9UbSAB+/++RWS1iixQCPXjk0xIZiDnwEdHYTtOW2aa5YwqYRLp/4jOBTjMFLvvha07ezyc/vcGNCVJDHajXIyiKmB4uzVRuM3W+jWtitgIoErDbKcoesoXc+ASlmt+M5A0OuGYmSmMU5N0Z8nnV54C+yu3kUud+RuQQtJhk96CtiqnAfg1Iz+ltZxAlfMmoLjjFOombpZPYF/tZ45y8be22H3gAb2J+zfkoc= ${username}" 
		];
	};
  services.openssh.enable = true;

  networking.firewall.enable = false;
}
