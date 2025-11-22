# Copyright 2025 Alec Ten Harmsel
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

EGIT_REPO_URI="https://github.com/trozamon/dabar.git"
DESCRIPTION="Alec's i3 bar"
HOMEPAGE="https://github.com/trozamon/dabar"

LICENSE="MIT"
SLOT="0"

# X11, Xi
RDEPEND="x11-libs/libX11 x11-libs/libXi"
DEPEND="${RDEPEND}"
