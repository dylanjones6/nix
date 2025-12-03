{ config, inputs, lib, pkgs, ... }:

{
  networking.networkmanager = {
       # enable = true; # already in configuration.nix
    ensureProfiles = {
      profiles."home" = {
        connection = {
   	    id = "home";
   	    type = "wifi";
   	    autoconnect = true;
   	    };
   	    wifi = {
   	      mode = "infrastructure";
   	      ssid = "$(cat /run/secrets/wifi/home/ssid)";
        };
        wifi-security = {
          key-mgmt = "wpa-psk";
	      psk = "$(cat /run/secrets/wifi/home/psk)";
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
}
