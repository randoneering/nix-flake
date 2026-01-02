{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.unstable.ghostty;
    settings = {
      theme = "Popping And Locking";
      shell-integration-features = "sudo";
    };
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
