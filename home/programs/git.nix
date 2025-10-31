{config, pkgs, username, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "${username}";
    userEmail = "justin@randoneering.tech";
    extraConfig = {
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/${hostname}.pub";
  };
  };
}
