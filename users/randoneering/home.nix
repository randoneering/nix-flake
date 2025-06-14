{pkgs, ...}: {
  imports = [
    ../../home/core.nix
    ../../home/programs
    ../../home/shell
    ../../home/programs/personal.nix
  ];

  programs.git = {
    userName = "randoneering";
    userEmail = "justin@randoneering.tech";
  };
}
