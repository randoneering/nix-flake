{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Popping & Locking";
      shell-integration-features = "sudo";
    };
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
