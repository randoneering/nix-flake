{config, ...}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      character = {
        # success_symbol = "[›](bold green)";
        # error_symbol = "[›](bold red)";
      };
    };
  };
}
