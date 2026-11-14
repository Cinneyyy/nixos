{ pkgs, ...}:
let
    key = name: "key.keyboard." + name;
    mouse = name: "key.mouse." + name;
    nokey = key "unknown";
in
{
    programs.prismlauncher = {
        enable = true;

        config = {
            java.mem = {
                min = 2048;
                max = 4096;
            };
            gametime = {
                record = true;
                show = true;
                showTotal = true;
                woDays = true;
            };
            window.minecraft.maximized = true;
        };

        instances = {
            "Fabric 26.3" = {
                group = "Releases";

                settings = {
                    ao = true;
                    gamma = 1.0;
                    enableVsync = true;
                    fov = 0.625;
                    fovEffectScale = 0.0;
                    darknessEffectScale = 0.0;
                    screenEffectScale = 0.0;
                    chunkSectionFadeInTime = 0;
                    graphicsPreset = "fancy";
                    renderDistance = 16;
                    entityDistanceScaling = 1.0;
                    simulationDistance = 12;
                    fullscreen = false;
                    exclusiveFullscreen = true;
                    guiScale = 3;
                    maxFps = 120;
                    renderClouds = true;
                    cloudRange = 64;
                    autoJump = false;
                    operatorItemsTab = true;
                    invertYMouse = true;
                    realmsNotifications = false;
                    showSubtitles = true;
                    mouseSensitivity = 0.5;
                    damageTiltStrength = 0.8;
                    narratorHotkey = false;
                    lang = "en_GB";
                    skipMultiplayerWarning = true;
                    joinedFirstServer = true;
                    #musicToast = "";
                    musicFrequency = "DEFAULT";
                    key_key = {
                        attack = mouse "right";
                        use = mouse "left";
                        playerlist = key "world.1";
                        socialInteractions = nokey;
                        friends = nokey;
                        togglePerspective = key "tab";
                        saveToolbarActivator = nokey;
                        loadToolbarActivator = nokey;
                        quickActions = nokey;
                        hotbar = {
                            "1" = key "1";
                            "2" = key "2";
                            "3" = key "3";
                            "4" = key "4";
                            "5" = key "x";
                            "6" = key "c";
                            "7" = key "v";
                            "8" = mouse "5";
                            "9" = mouse "4";
                        };
                        camerautils = {
                            zoom = key "r";
                            third_person_cam_1 = nokey;
                            third_person_cam_2 = nokey;
                            third_person_offset = nokey;
                            detach_camera = nokey;
                            zoom_animation = nokey;
                        };
                        freecam = {
                            toggle = key "g";
                            controlPlayer.toggle = key "9";
                            outlinePlayer.toggle = key "0";
                        };
                        lighty = {
                            enable = "f7";
                            toggle = "f8";
                        };
                    };
                    key_fullbrightnesstoggle.key.togglefullbrightness = key "y";
                    key_iris.keybind = {
                        reload = key "semicolon";
                        toggleShaders = key "left.bracket";
                        shaderPackSelection = key "apostrophe";
                    };
                    soundCateogry_master = 0.5;
                    soundCateogry_music = 0.1;
                    soundCateogry_record = 0.75;
                    soundCateogry_weather = 0.0;
                    soundCateogry_block = 0.6;
                    soundCateogry_hostile = 0.33;
                    soundCateogry_neutral = 0.1;
                    soundCateogry_player = 0.75;
                    soundCateogry_ambient = 0.2;
                    soundCateogry_voice = 0.0;
                    soundCateogry_ui = 0.5;
                };

                version = "26.3";

                mod = {
                    loader = {
                        name = "fabric";
                        version = "0.19.5";
                    };
                    mods = [
                        (builtins.fetchurl {
                            name = "appleskin-fabric-mc26.3-3.0.10.jar";
                            url = "https://modrinth.com/mod/EsAfCjCV";
                        })
                        (builtins.fetchurl {
                            name = "camerautils-fabric-1.1.2+26.3.jar";
                            url = "https://modrinth.com/mod/rrwQMaWQ";
                        })
                        (builtins.fetchurl {
                            name = "cloth-config-fabric-26.3.159.jar";
                            url = "https://modrinth.com/mod/9s6osm5g";
                        })
                        (builtins.fetchurl {
                            name = "collective-26.3.0-8.41.jar";
                            url = "https://modrinth.com/mod/e0M1UDsY";
                        })
                        (builtins.fetchurl {
                            name = "componentviewer-fabric-1.3.6+26.3.jar";
                            url = "https://modrinth.com/mod/P9vIqP8R";
                        })
                        (builtins.fetchurl {
                            name = "c2me-fabric-mc26.3-0.4.2-alpha.0.89.jar";
                            url = "https://modrinth.com/mod/VSNURh3q";
                        })
                        (builtins.fetchurl {
                            name = "continuity-3.0.1+26.3.jar";
                            url = "https://modrinth.com/mod/1IjD5062";
                        })
                        (builtins.fetchurl {
                            name = "entityculling-fabric-1.11.2-mc26.3.jar";
                            url = "https://modrinth.com/mod/NNAgCjsB";
                        })
                        (builtins.fetchurl {
                            name = "fabric-api-0.161.0+26.3.jar";
                            url = "https://modrinth.com/mod/P7dR8mSH";
                        })
                        (builtins.fetchurl {
                            name = "ferritecore-9.0.0-fabric.jar";
                            url = "https://modrinth.com/mod/uXXizFIs";
                        })
                        (builtins.fetchurl {
                            name = "freecam-fabric-1.5.0-alpha.2+mc26.3.jar";
                            url = "https://modrinth.com/mod/XeEZ3fK2";
                        })
                        (builtins.fetchurl {
                            name = "fullbrightnesstoggle-26.3.0-4.7.jar";
                            url = "https://modrinth.com/mod/aEK1KhsC";
                        })
                        (builtins.fetchurl {
                            name = "ImmediatelyFast-Fabric-1.17.1+26.3.jar";
                            url = "https://modrinth.com/mod/5ZwdcRci";
                        })
                        (builtins.fetchurl {
                            name = "iris-fabric-1.11.7+mc26.3.jar";
                            url = "https://modrinth.com/mod/YL57xq9U";
                        })
                        (builtins.fetchurl {
                            name = "lighty-fabric-4.0.1+26.3.jar";
                            url = "https://modrinth.com/mod/yjvKidNM";
                        })
                        (builtins.fetchurl {
                            name = "litematica-fabric-26.3-0.29.1.jar";
                            url = "https://modrinth.com/mod/bEpr0Arc";
                        })
                        (builtins.fetchurl {
                            name = "lithium-fabric-0.26.2+mc26.3.jar";
                            url = "https://modrinth.com/mod/gvQqBUqZ";
                        })
                        (builtins.fetchurl {
                            name = "locator-heads-2.5.0.jar";
                            url = "https://modrinth.com/mod/L4pt5egz";
                        })
                        (builtins.fetchurl {
                            name = "malilib-fabric-26.3-0.30.2.jar";
                            url = "https://modrinth.com/mod/GcWjdA9I";
                        })
                        (builtins.fetchurl {
                            name = "modmenu-21.0.0.jar";
                            url = "https://modrinth.com/mod/mOgUt4GM";
                        })
                        (builtins.fetchurl {
                            name = "morechathistory-2.0.0.jar";
                            url = "https://modrinth.com/mod/8qkXwOnk";
                        })
                        (builtins.fetchurl {
                            name = "moreculling-fabric-26.3-1.9.0.jar";
                            url = "https://modrinth.com/mod/51shyZVL";
                        })
                        (builtins.fetchurl {
                            name = "peek-fabric-1.6.0+26.3.jar";
                            url = "https://modrinth.com/mod/TnOXNf5e";
                        })
                        (builtins.fetchurl {
                            name = "placeholder-api-3.2.0+26.3.jar";
                            url = "https://modrinth.com/mod/eXts2L7r";
                        })
                        (builtins.fetchurl {
                            name = "shulkerboxtooltip-fabric-5.4.2+26.3.jar";
                            url = "https://modrinth.com/mod/2M01OLQq";
                        })
                        (builtins.fetchurl {
                            name = "sodium-fabric-0.9.3-alpha.1+mc26.3.jar";
                            url = "https://modrinth.com/mod/AANobbMI";
                        })
                        (builtins.fetchurl {
                            name = "sodium-extra-fabric-0.9.4+mc26.3.jar";
                            url = "https://modrinth.com/mod/PtjYWJkn";
                        })
                        (builtins.fetchurl {
                            name = "nofogmod-1.0_fabric-mc26.3.jar";
                            url = "https://modrinth.com/mod/wAEWD77L";
                        })
                        (builtins.fetchurl {
                            name = "worldedit-mod-7.4.6-beta-02.jar";
                            url = "https://modrinth.com/mod/1u6JkXh5";
                        })
                        (builtins.fetchurl {
                            name = "yet_another_config_lib_v3-3.9.7+26.3-fabric.jar";
                            url = "https://modrinth.com/mod/1eAoo2KR";
                        })
                    ];
                };
            };
        };
    };
}
