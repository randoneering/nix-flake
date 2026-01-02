{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Popping And Locking";
      package = pkgs.unstable.ghostty;
      shell-integration-features = "sudo";
    };
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
