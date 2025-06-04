{pkgs, ...}: {

  imports = [
    ../../home/core.nix
    ./programs
    ./shell
  ];

  programs.git = {
    userName = "randoneering";
    userEmail = "justin@randoneering.tech";
  };
}
