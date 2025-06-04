{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Static Site
    hugo

    # Social
    element-desktop
    discord
    signal-desktop

    # Utility
    nfs-utils
    atuin # will want to set this up in shell soon
    # Office
    onlyoffice-desktopeditors

  ];
}
