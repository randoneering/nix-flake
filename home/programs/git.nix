{
  config,
  pkgs,
  username,
  hostname,
  ...
}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "${username}";
    userEmail = "justin@randoneering.tech";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/${hostname}.pub";
    };
  };
}
