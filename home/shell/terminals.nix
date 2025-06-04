{ pkgs, ... }:

let
  font = "Fira Code Nerd Font";
in
{
  programs.kitty = {
    enable = true;
    settings = {
      };

    };

}
