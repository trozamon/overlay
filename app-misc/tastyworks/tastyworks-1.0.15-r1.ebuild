# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit java-pkg-2 rpm

DESCRIPTION="Option trading for active traders"
HOMEPAGE="https://tastyworks.com"
SRC_URI="https://download.tastyworks.com/desktop-1.x.x/${PV}/tastyworks-${PV}-1.x86_64.rpm"

LICENSE="Tastyworks"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="virtual/jre:*"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /opt/tastyworks
	doins -r opt/tastyworks/app
	doins -r opt/tastyworks/runtime

	into /opt/tastyworks/bin
	doins opt/tastyworks/bin/tastyworks.desktop
	doins opt/tastyworks/bin/tastyworks.png
	dolib.so opt/tastyworks/bin/libapplauncher.so
	dobin opt/tastyworks/bin/tastyworks

	dosym "${ED%/}"/opt/tastyworks/bin/tastyworks /usr/bin/tastyworks
}
