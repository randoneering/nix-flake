{
  hostname,
  username,
  ...
}: {
  users.users.justin = {
  isNormalUser = true;
  description = "justin";
  extraGroups = [ "networkmanager" "wheel" ];
  };
}
