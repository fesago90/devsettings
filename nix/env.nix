{ pkgs ? import <nixpkgs> {} }:

let
  py3WithPackages = pkgs.python3.withPackages (ps: with ps; [ ]);
in {
  inherit (pkgs)
    python3
    ripgrep
    lldb
    vim
    git
    fzf
    unzip
    tmux;
  python = py3WithPackages;
}