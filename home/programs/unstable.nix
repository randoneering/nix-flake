{pkgs, ...}: {

  home.packages = with pkgs.unstable; [
      # utils
      dbeaver-bin
      popsicle
      dconf
      freshfetch
      gimp3

      # productivity
      obsidian
      planify
      claude-code
      zed-editor

      # Security
      syft
      grype
      proton-pass
      proton-authenticator
      bitwarden-desktop
      protonvpn-gui
      protonmail-desktop

      # Static Site
      hugo

      # Desktop Customization
      gnome-tweaks
      gnome-extension-manager

      # Social
      discord
      slack
      signal-desktop

      # Office
      onlyoffice-desktopeditors


  ];
}
