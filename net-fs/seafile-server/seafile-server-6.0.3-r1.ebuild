# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="Seafile's server component"
HOMEPAGE="https://seafile.com https://github.com/haiwen/seafile-server"
SRC_URI="https://github.com/haiwen/seafile-server/archive/v${PV}-server.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mysql postgres python"

RDEPEND="net-libs/ccnet
dev-lang/vala:0.30
dev-libs/libsearpc
net-libs/libevhtp
mysql? ( dev-db/mariadb )
postgres? ( dev-db/postgresql:9.5 )
python? ( dev-lang/python:2.7 )"

DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	mv "${S}-server" "${S}" || die "trying to fix ${S} failed"
}

src_prepare() {
	eapply_user
	eapply "${FILESDIR}/valac-to-valac-0.30.patch"
	eautoreconf
}

src_configure() {
	pyexecdir="/usr/lib/python2.7/site-packages" econf \
		$(use_with mysql) \
		$(use_with postgres postgresql) \
		$(use_enable python) \
		--disable-fuse \
		--enable-console
}

src_compile() {
	emake || die "emake failed"
}
