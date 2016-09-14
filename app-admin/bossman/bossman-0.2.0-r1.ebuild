# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="A configuration manager"
HOMEPAGE="https://github.com/trozamon/bossman"
SRC_URI="https://github.com/trozamon/bossman/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

DEPEND="net-libs/gnutls net-misc/curl
systemd? ( sys-apps/systemd )"

RDEPEND="${DEPEND}"
