{
  hostname,
  username,
  ...
}: {
    users.users.randoneering = {
    isNormalUser = true;
    description = "randoneering";
    extraGroups = [ "networkmanager" "wheel" ];
    };
}
