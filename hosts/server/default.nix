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
  # users.users.dilly = {
  #   openssh.authorizedKeys.keys = [
  #     "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDhrmdbqS5Irbo0RnllqbkPIULF7AQGcBIN6xkZm7Cd9 dilly@nixos-t480"
  #   ];
  # };

  environment.systemPackages = with pkgs; [
    hugo
  ];
  
  services.openssh.enable = true;

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
