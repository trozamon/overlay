# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="RPC framework used by Seafile"
HOMEPAGE="https://www.seafile.com https://github.com/haiwen/libsearpc"
SRC_URI="https://github.com/haiwen/libsearpc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/glib:2
dev-libs/jansson"

DEPEND="${RDEPEND}
dev-lang/python:2.7"

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf
}

src_compile() {
	emake || die "emake failed"
}
