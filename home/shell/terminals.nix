{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      #theme = "";
      shell-integration-features = "sudo";
    };
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
