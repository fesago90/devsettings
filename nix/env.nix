{ pkgs ? import <nixpkgs> {} }:

let
  py3WithPackages = pkgs.python3.withPackages (ps: with ps; [ openai ]);
in {
  inherit (pkgs)
    python3
    gdb
    gcc
    #lldb
    #clang
    vim
    git
    fzf
    tmux;
  python = py3WithPackages;
}