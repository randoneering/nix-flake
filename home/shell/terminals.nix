{pkgs, ...}:{


programs.ghostty = {
  enable = true;
  settings = {
    theme = "Popping and Locking";
    shell-integration-features = "sudo";
  };
  enableFishIntegration = true;
  enableBashIntegration = true;
};

}
