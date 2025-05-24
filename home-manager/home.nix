{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
    # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix

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

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
