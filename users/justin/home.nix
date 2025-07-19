{pkgs, ...}: {
  imports = [
    ../../home/core.nix
    ../../home/programs
    ../../home/shell
    ../../home/programs/personal.nix
    ../../home/utils
  ];
}
