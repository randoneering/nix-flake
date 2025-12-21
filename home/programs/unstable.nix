{pkgs, ...}: {

  home.packages = with pkgs.unstable; [
      dbeaver-bin
  ];
}
