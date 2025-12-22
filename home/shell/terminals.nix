{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Popping And Locking";
      shell-integration-features = "sudo";
    };
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
