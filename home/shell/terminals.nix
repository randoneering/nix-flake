{ pkgs, ... }:

let
  font = "Fira Code Nerd Font";
in
{
  programs.kitty = {
    enable = true;
    settings = {
      };

      font = {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        size = 11;
      };

    };
  };
}
