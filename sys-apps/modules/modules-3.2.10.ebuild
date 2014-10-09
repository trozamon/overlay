# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A simple way to manage your environment"
HOMEPAGE="modules.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/project/modules/Modules/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="X"

RDEPEND="dev-lang/tcl
		X? ( x11-base/xorg-server )"

DEPEND="${RDEPEND}"

src_configure() {
	econf $(use_with X x)
}

src_install() {
	emake DESTDIR="${D}" install || die "Installation failed"
}

pkg_postinst() {
	elog "Please source the relevant shell initialization file under"
	elog "'/usr/Modules/${PV}/init'. Unfortunately, there's no great"
	elog "way to do this automatically."
}
