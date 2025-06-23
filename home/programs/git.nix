{pkgs, ...}: {
  home.packages = [pkgs.gh];

  home.file.".ssh/allowed_signers".text =
    "* ${builtins.readFile /home/randoneering/.ssh/l15.pub}";

  programs.git = {
    enable = true;
    userName = "randoneering";
    userEmail = "justin@randoneering.tech";
    extraConfig = {
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/l15.pub";
  };
  };
}
