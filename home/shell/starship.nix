{config, lib,...}:
{
  programs = {
    starship = {
      enable = true;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableZshIntegration = config.programs.zsh.enable;
      settings = {
        add_newline = false;
        command_timeout = 1000;
        format =  "$all";
      };
    };
  };




}
