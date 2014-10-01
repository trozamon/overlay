# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils flag-o-matic multilib java-utils-2

DESCRIPTION="A cluster manager that simplifies running applications on a shared pool of servers"
HOMEPAGE="http://mesos.apache.org/"

SRC_URI="http://apache.org/dist/${PN}/${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="~amd64"
IUSE="java python"
SLOT="0"

#TODO Fix deps
RDEPEND="python? ( dev-lang/python dev-python/boto )
		java? ( virtual/jre )
		net-misc/curl
		dev-libs/cyrus-sasl"

DEPEND="java? ( dev-java/maven-bin >=virtual/jdk-1.6 )
		${RDEPEND}"

src_configure() {
	econf \
		$(use_enable python) \
		$(use_enable java)
}

src_compile() {
	emake V=1
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
