{config, pkgs, ...}: {
  programs.atuin = {
    enable = true;
    package = pkgs.unstable.atuin;
    enableFishIntegration = true;
    settings = {
      search_mode = "fuzzy";
    };
  };
}
