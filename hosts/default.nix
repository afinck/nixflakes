{ hostname, ... }: {
		imports = [ ./${hostname} ./internationalisation ];
}