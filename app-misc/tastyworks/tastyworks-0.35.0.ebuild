# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit java-pkg-2 rpm

DESCRIPTION="Option trading for active traders"
HOMEPAGE="https://tastyworks.com"
SRC_URI="https://download.tastyworks.com/desktop/${PV}/tastyworks-${PV}.rpm"

LICENSE="Tastyworks"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="virtual/jre:1.8"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /opt/tastyworks
	doins -r opt/tastyworks/app
	doins -r opt/tastyworks/runtime
	doins opt/tastyworks/libpackager.so
	doins opt/tastyworks/tastyworks.png

	exeinto /opt/tastyworks
	doexe opt/tastyworks/tastyworks

	dosym "${ED%/}"/opt/tastyworks/tastyworks /usr/bin/tastyworks
}
