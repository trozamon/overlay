# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="A framework for writing networked applications"
HOMEPAGE="https://github.com/haiwen/ccnet"
SRC_URI="https://github.com/haiwen/ccnet/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ldap python"

RDEPEND="dev-libs/libsearpc
dev-db/sqlite:3
dev-libs/libevent
dev-db/libzdb
dev-lang/vala:0.30
ldap? ( net-nds/openldap )
python? ( dev-lang/python:2.7 )
"

DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user
	eapply "${FILESDIR}/valac-to-valac-0.30.patch"
	eautoreconf
}

src_configure() {
	econf \
		--enable-client \
		--enable-console \
		$(use_enable ldap) \
		$(use_enable python) \
		--enable-server \
		--disable-cluster
}

src_compile() {
	emake || die "emake failed"
}
