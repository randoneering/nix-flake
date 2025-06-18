{
  config,
  pkgs,
  ...
}: {
  # https://alberand.com/nixos-wireguard-vpn.html for future edits
  networking.wg-quick.interfaces = let
    server_ip = "69.4.234.131";
  in {
    wg0 = {
      # IP address of this machine in the *tunnel network*
      address = [
        "10.76.1.121/32"
        "fc00:bbbb:bbbb:bb01::d:178/128"
      ];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 51820;

      # Path to the private key file.
      privateKeyFile = "/etc/mullvad-vpn.key";

      peers = [
        {
          publicKey = "2yVEeOFScneJRCVTrqCjKlKHg3J2wwOwkY28iy47J1Q=";
          allowedIPs = ["0.0.0.0/0"];
          endpoint = "${server_ip}:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
