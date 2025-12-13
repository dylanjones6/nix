{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-server"; # Define your hostname.

  #services.xserver.xkb = {
  #  layout = "us";
  #  variant = "";
  #};

  time.timeZone = "America/Denver";

  #!TODO set when new nix server installed
  users.users.dilly.openssh.authorizedKeys.keys =
  [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMJTVmooFcqj6srpgCsfjonoDqQ0inHSfOtBJPYWWSYHKNZ9ncUdQpKchi1NxzAQ8TUyRu8oip37bq5v27f9f3PKWtPcdH8U2aqn/MG+czxLezRomPWzGXzernzvT/r/xV58s6f0E/ED57sgTYD0y2eCVAHaIm7F7/Bc8bu3S4OEt0lIDfmAysyAhIbfBBB2PwhhYuRWGwIZLW4fkburlbrm0iq3IgGy1tCRaxx12Gr+VL09v+RpEOlYd0ytYNTvIbGBre1r7xqGtw0t6ZWXFR0fb1TXSVQtshK/izB9aSEFp4mbVPuD4igA4kv/w7cl0qydgRawB0xjPeLbZuUiqvDdEKfHl+VzGDe8MZQgqnjXGL71k+1Yl9xDVzIRhrvnEgswXPcXRe2doZKpFXyBsTA8nw+p9zNDXQ5q/9vgm13jTVZBLdXD7I8GYQCRFucaWRRxrw/WGQk9fHoy1lNcsnoswt6XbxZS12vJmJE2Hovmlmd9eVTuXzaJxP0RghbuE= dilly@nixos-t480"
  ];

  environment.systemPackages = with pkgs; [
    hugo
  ];

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true; #!TODO CHANGE THIS EVENTUALLY!
    };
  };

  users.users.root.openssh.authorizedKeys.keys =
  [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMJTVmooFcqj6srpgCsfjonoDqQ0inHSfOtBJPYWWSYHKNZ9ncUdQpKchi1NxzAQ8TUyRu8oip37bq5v27f9f3PKWtPcdH8U2aqn/MG+czxLezRomPWzGXzernzvT/r/xV58s6f0E/ED57sgTYD0y2eCVAHaIm7F7/Bc8bu3S4OEt0lIDfmAysyAhIbfBBB2PwhhYuRWGwIZLW4fkburlbrm0iq3IgGy1tCRaxx12Gr+VL09v+RpEOlYd0ytYNTvIbGBre1r7xqGtw0t6ZWXFR0fb1TXSVQtshK/izB9aSEFp4mbVPuD4igA4kv/w7cl0qydgRawB0xjPeLbZuUiqvDdEKfHl+VzGDe8MZQgqnjXGL71k+1Yl9xDVzIRhrvnEgswXPcXRe2doZKpFXyBsTA8nw+p9zNDXQ5q/9vgm13jTVZBLdXD7I8GYQCRFucaWRRxrw/WGQk9fHoy1lNcsnoswt6XbxZS12vJmJE2Hovmlmd9eVTuXzaJxP0RghbuE= dilly@nixos-t480"
  ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 1313 ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
