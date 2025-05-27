{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [


  ];

  home.username = "randoneering";
  home.homeDirectory = "/home/randoneering";

  programs.git = {
    enable = true;
    userName = "randoneering";
    userEmail = "justin@randoneering.tech";
  };


  programs.starship = {
    enable = true;
        enableFishIntegration = true;
  };

  programs.kitty = {
    enable = true;
    # custom settings
    settings = {
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  home.stateVersion = "25.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
