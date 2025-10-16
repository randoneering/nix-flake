{config, pkgs, ...}:
{
  imports = [
    ./common.nix
    ./starship.nix
    ./terminals.nix
    ./fish.nix
    ./helix.nix
    ./atuin.nix
    ./bash.nix
  ];

}
