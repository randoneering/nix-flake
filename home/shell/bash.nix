{config, username, ...}:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
    eval $(ssh-agent)
    '';
  };
}
