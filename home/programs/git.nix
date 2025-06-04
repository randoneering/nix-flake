{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "randoneering";
    userEmail = "justin@randoneering.tech";
  };
}
