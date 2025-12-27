{username, ...}: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
