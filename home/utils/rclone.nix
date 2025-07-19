{config, pkgs, ...}:
{


  home.packages = [ pkgs.rclone ];
  # systemd.user.services.rclone-mounts = {
  #   Unit = {
  #     Description = "Rclone ProtonDrive rclone";
  #     After = [ "network-online.target" ];
  #   };
  #   Service = {
  #     Type = "notify";
  #     ExecStartPre = "/usr/bin/env mkdir -p %h/protonDrive";
  #     ExecStart = "${pkgs.rclone}/bin/rclone --config=%h/.config/rclone/protondrive.conf --vfs-cache-mode writes --ignore-checksum mount \"protonDrive:\" \"protonDrive\"";
  #     ExecStop="/bin/fusermount -u %h/protonDrive/%i";
  #   };
  #   Install.WantedBy = [ "default.target" ];
  # };
}
