# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="A better libevent2 HTTP API"
HOMEPAGE="https://github.com/ellzey/libevhtp"
SRC_URI="https://github.com/ellzey/libevhtp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libevent"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DEVHTP_BUILD_SHARED=ON
	)

	cmake-utils_src_configure
}
