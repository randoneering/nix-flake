{
  config,
  username,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;
    package = pkgs.unstable.bash;
    bashrcExtra = ''
      eval $(ssh-agent)
    '';
  };
}
