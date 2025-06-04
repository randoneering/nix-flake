{pkgs, ...}: {
  imports = [
    ../../home/core.nix
    ../../home/programs
    ../../home/shell
  ];

  programs.git = {
    userName = "randoneering";
    userEmail = "justin@randoneering.tech";
  };
}
