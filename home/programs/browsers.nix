{
  pkgs,
  config,
  username,
  ...
}: {
  programs = {
    firefox = {
      enable = true;
      profiles.${username} = {};
    };
    librewolf = {
      enable = true;
      profiles.${username} = {};
    };
  };
}
