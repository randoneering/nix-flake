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
    settings = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.name = "${username}";
      user.email = "justin@randoneering.tech";
      user.signingkey = "~/.ssh/${hostname}.pub";
    };
  };
}
