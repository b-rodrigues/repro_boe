# This file was generated by the {rix} R package v0.7.1 on 2024-06-10
# with following call:
# >rix(r_ver = "8ad5e8132c5dcf977e308e7bf5517cc6cc0bf7d8",
#  > r_pkgs = "shiny",
#  > ide = "other",
#  > project_path = ".",
#  > shell_hook = "Rscript -e 'shiny::runApp()' ")
# It uses nixpkgs' revision 8ad5e8132c5dcf977e308e7bf5517cc6cc0bf7d8 for reproducibility purposes
# which will install R version 4.2.2.
# Report any issues to https://github.com/b-rodrigues/rix
let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/8ad5e8132c5dcf977e308e7bf5517cc6cc0bf7d8.tar.gz") {};
 
 rpkgs = builtins.attrValues {
  inherit (pkgs.rPackages) 
      shiny;
 };
   
 system_packages = builtins.attrValues {
  inherit (pkgs) R glibcLocales nix;
 };
  
in

 pkgs.mkShell {
   LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
   LANG = "en_US.UTF-8";
   LC_ALL = "en_US.UTF-8";
   LC_TIME = "en_US.UTF-8";
   LC_MONETARY = "en_US.UTF-8";
   LC_PAPER = "en_US.UTF-8";
   LC_MEASUREMENT = "en_US.UTF-8";

   buildInputs = [  rpkgs  system_packages  ];
 }
