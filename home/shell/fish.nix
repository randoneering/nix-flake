{config, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      eval ssh-agent
    '';
  };
}
