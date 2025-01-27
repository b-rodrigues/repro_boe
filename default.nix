let
 pkgs = import (fetchTarball "https://github.com/rstats-on-nix/nixpkgs/archive/2025-01-27.tar.gz") {};
  rix = [(pkgs.rPackages.buildRPackage {
            name = "rix";
            src = pkgs.fetchgit {
             url = "https://github.com/ropensci/rix/";
             rev = "3fa208df8e1c1804e96a5885ec094a06e79e897b";
             sha256 = "sha256-W5Cpe5OqAjBPTpoTQ5sZQBnzUkIVysdt92Os7hR+6P8=";
            };
            propagatedBuildInputs = builtins.attrValues {
              inherit (pkgs.rPackages) codetools httr jsonlite sys;
            };
         })
  ];
 system_packages = builtins.attrValues {
  inherit (pkgs) R glibcLocalesUtf8 quarto nix;
};
  in
  pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocalesUtf8}/lib/locale/locale-archive" else "";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";

    buildInputs = [ system_packages rix pkgs.rPackages.quarto pkgs.rPackages.targets pkgs.rPackages.tarchetypes pkgs.rPackages.withr ];

    shellHook = '' Rscript -e "targets::tar_make()" '';
  }

