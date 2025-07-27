{config, pkgs, ...}:
{
  imports = [
    ./common.nix
    ./starship.nix
    ./terminals.nix
    ./fish.nix
    ./atuin.nix
    ./bash.nix
  ];

}
