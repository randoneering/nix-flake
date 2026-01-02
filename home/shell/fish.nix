{config, pkgs, ...}: {
  programs.fish = {
    enable = true;
    package = pkgs.unstable.fish;
    interactiveShellInit = ''
      eval ssh-agent
    '';
  };
}
