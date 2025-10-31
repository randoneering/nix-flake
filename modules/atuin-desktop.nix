{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  wrapGAppsHook4,
  dbus,
  zlib,
  fontconfig,
  openssl,
  webkitgtk_4_1,
  gtk3,
  pango,
  cairo,
  gdk-pixbuf,
  libsoup_3,
  glib,
  glib-networking,
  gcc,
  pkg-config,
}:
stdenv.mkDerivation rec {
  pname = "atuin-desktop";
  version = "0.1.0";

  src = fetchurl {
    url = "https://github.com/atuinsh/desktop/releases/download/v0.1.0/Atuin_Desktop_0.1.0_amd64.deb";
    sha256 = "sha256:3fb163b5abc6ab68e9a0c3bc19835e8e50c328dfa021f0237608cb905e198d18";
  };

  nativeBuildInputs = [
    dpkg
    wrapGAppsHook4
    pkg-config
  ];

  buildInputs = [
    # System libraries
    dbus
    zlib
    fontconfig

    # GTK and related libraries
    webkitgtk_4_1
    gtk3
    pango
    cairo
    gdk-pixbuf

    # Network and utility libraries
    libsoup_3

    # GLib libraries
    glib
    glib-networking

    # Runtime dependencies
    gcc.cc.lib # For libgcc_s.so.1

    openssl
  ];

  unpackPhase = ''
    dpkg-deb -x $src .
  '';

  installPhase = ''
    mkdir -p $out
    cp -r usr/* $out/ || true

    # Ensure desktop files exist and are properly configured
    if [ -d $out/share/applications ]; then
      for desktop in $out/share/applications/*.desktop; do
        if [ -f "$desktop" ]; then
          substituteInPlace "$desktop" \
            --replace "Exec=/usr/bin/" "Exec=$out/bin/"
        fi
      done
    fi
  '';

  preFixup = ''
    gappsWrapperArgs+=(
      # Ensure the binary can find all required libraries
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath buildInputs}
    )
  '';

  postFixup = ''
    echo "=== Debugging binary ==="
    if [ -f "$out/bin/atuin-desktop" ]; then
      echo "Binary exists"
      file "$out/bin/atuin-desktop"
      ldd "$out/bin/atuin-desktop" || echo "ldd failed"
      readelf -l "$out/bin/atuin-desktop" | grep interpreter || echo "No interpreter found"
    else
      echo "Binary not found, listing contents:"
      find "$out" -name "*atuin*" -type f
    fi
    echo "=== End debugging ==="
    find $out/bin -type f -executable | while read -r bin; do
      echo "Patching binary: $bin"

      # Check if it's an ELF binary
      if file "$bin" | grep -q "ELF"; then
        echo "  Setting interpreter..."
        patchelf --set-interpreter ${stdenv.cc.bintools.dynamicLinker} "$bin" || echo "  Failed to set interpreter"

        echo "  Setting rpath..."
        patchelf --set-rpath ${lib.makeLibraryPath buildInputs} "$bin" || echo "  Failed to set rpath"

        echo "  Shrinking rpath..."
        patchelf --shrink-rpath "$bin" || echo "  Failed to shrink rpath"
      fi
    done
  '';

  meta = with lib; {
    description = "Atuin Desktop";
    homepage = "https://atuin.sh/#desktop-section";
    license = licenses.asl20;
    maintainers = [
      randoneering
      dzervas
    ];
    platforms = ["x86_64-linux"];
  };
}
