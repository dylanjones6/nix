# ata-ST6000VN001-2BB186_ZR10S315 -> ../../sda
# ata-Samsung_SSD_860_EVO_M.2_250GB_S413NS0R327812T -> ../../sdb
# ata-ST6000VN001-2BB186_ZR10SBCW -> ../../sdc
{
  disko.devices = {
    disk = {
      ssd0 = {
        type = "disk";
        device = "/dev/sdb";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "nofail" ];
              };
            };
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
      hdd0 = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type =  "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "pool0";
              };
            };
          };
        };
      };
      hdd1 = {
        type = "disk";
        device = "/dev/sdc";
        content = {
          type =  "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "pool0";
              };
            };
          };
        };
      };
    zpool = {
      zroot = {
        type = "zpool";
        rootFsOptions = {
          mountpoint = "none";
          #compression = "zstd";
          compression = "lz4";
          acltype = "posixacl";
          xattr = "sa";
          "com.sun:auto-snapshot" = "true";
        };
        options.ashift = "13"; # 13 b/c it's an ssd
        datasets = {
          "root" = {
            type = "zfs_fs";
            options = {
              encryption = "aes-256-gcm";
              keyformat = "passphrase";
              #keylocation = "file:///tmp/secret.key";
              keylocation = "prompt";
            };
            mountpoint = "/";
          };
          "root/nix" = {
            type = "zfs_fs";
            options.mountpoint = "/nix";
            mountpoint = "/nix";
          };

          # README MORE: https://wiki.archlinux.org/title/ZFS#Swap_volume
          "root/swap" = {
            type = "zfs_volume";
            size = "24G";
            content = {
              type = "swap";
            };
            options = {
              volblocksize = "4096";
              compression = "zle";
              logbias = "throughput";
              sync = "always";
              primarycache = "metadata";
              secondarycache = "none";
              "com.sun:auto-snapshot" = "false";
            };
          };
        };
      pool0 = {
        mountpoint = "none";
        type = "zpool";
        mode = "mirror";
        options.cachefile = "none";
        rootFsOptions = {
          compression = "lz4";
          acltype = "posixacl";
          xattr = "sa";
          "com.sun:auto-snapshot" = "true";
        };
        options.ashift = 12;
        datasets = {
          "pool0" = {
            type = "zfs_fs";
            options = {
              encryption = "aes-256-gcm";
              keyformat = "passphrase";
              keylocation = "prompt";
              #keylocation = "file://home/dilly/secrets/secret.key"; # this is probably not gonna work
            };
            mountpoint = "/pool0";
          };
        };
      };
    };
  };
}
