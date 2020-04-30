{ stdenv, fetchurl, lib, pkgs, qtbase, qtmultimedia, qtsvg, qtdeclarative, qttools, qtgraphicaleffects, qtquickcontrols2, full
, libsecret, libGL, libpulseaudio, glib, wrapQtAppsHook, fetchFromGitHub, git, buildGoPackage }:

let
  version = "1.2.6-git";

  description = ''
    An application that runs on your computer in the background and seamlessly encrypts
    and decrypts your mail as it enters and leaves your computer.

    To work, gnome-keyring service must be enabled.
  '';
in buildGoPackage {
  pname = "protonmail-bridge";
  inherit version;

  src = fetchFromGitHub {
    owner = "ProtonMail";
    repo = "proton-bridge";
    rev = "409abba995e7add59ab8e0391dbe1f4132695fc0";
    sha256 = "1iapk5kca2xilhmh5akf8x0j7wk32f91l3xjp8vd5065206zpgwb";
  };

  # postFixup =  ''
  #   substituteInPlace $out/share/applications/protonmail-bridge.desktop \
  #     --replace "/usr/" "$out/" \
  #     --replace "Exec=protonmail-bridge" "Exec=$out/bin/protonmail-bridge"
  # '';

  # buildFlagsArray = 

  goPackagePath = "github.com/ProtonMail/proton-bridge";
  goDeps = ./deps.nix;
  buildInputs = [ git qtbase qtquickcontrols2 qtmultimedia qtgraphicaleffects qtdeclarative ];

  meta = with stdenv.lib; {
    homepage = "https://www.protonmail.com/bridge";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    maintainers = with maintainers; [ lightdiscord ];

    inherit description;
  };
}
