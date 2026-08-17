{ lib, pkgs, ... }:
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    desktopEntries = {
      handbrake = {
        categories = [
          "GTK"
          "AudioVideo"
          "Video"
        ];
        exec = "handbrake %f";
      name = "HandBrake";
      terminal = false;
      icon = "fr.handbrake.ghb";
      comment = "Transcodes DVD, Blu-ray, and other media";
        mimeType = [
          "application/ogg"
          "application/x-extension-mp4"
          "application/x-flac"
          "application/x-matroska"
          "application/x-ogg"
          "audio/ac3"
          "audio/mp4"
          "audio/mpeg"
          "audio/ogg"
          "audio/x-flac"
          "audio/x-matroska"
          "audio/x-mp2"
          "audio/x-mp3"
          "audio/x-mpeg"
          "audio/x-vorbis"
          "video/mp4"
          "video/mp4v-es"
          "video/mpeg"
          "video/msvideo"
          "video/quicktime"
          "video/vnd.divx"
          "video/x-avi"
          "video/x-m4v"
          "video/x-matroska"
          "video/x-mpeg"
          "video/x-ms-wmv"
          "video/ogg"
          "video/x-ogm+ogg"
          "video/x-theora+ogg"
          "x-content/video-dvd"
          "x-content/video-vcd"
          "x-content/video-svc"
        ];
      };
    };
  };
}
