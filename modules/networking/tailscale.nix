{
  pkgs,
  lib,
  username,
  ...
}: {
  services.tailscale = {
    enable = true;
  };
}
