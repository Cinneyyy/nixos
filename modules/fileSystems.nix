{ ... }:

{
    # Previous fstab config:
    # UUID=a651ae56-a816-428c-84b7-a3220d923e10 /media/colin/4T-SSD ext4 defaults 0 0
    # UUID=b55a5493-6da9-4abe-823e-3aff9aeb7b1e /media/colin/4T-HDD ext4 defaults 0 0

    # 4TB SSD (T7)
    fileSystems."/home/colin/mnt/4T-SSD" = {
        device = "/dev/disk/by-uuid/a651ae56-a816-428c-84b7-a3220d923e10";
        fsType = "ext4";
        options = [
            "users"
            "nofail"
            "exec"
            "x-gvfs-show"
            "noatime"
        ];
    };

    services.gvfs.enable = true;
}
