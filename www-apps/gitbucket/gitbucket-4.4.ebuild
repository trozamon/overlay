# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit java-pkg-2

DESCRIPTION="An open-source git service"
HOMEPAGE="https://github.com/gitbucket/gitbucket"
SRC_URI="https://github.com/gitbucket/gitbucket/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user
}

src_compile() {
	JAVA_OPTS="-Duser.home=${S}" \
		./sbt.sh executable
}

src_install() {
	dodir usr/lib/gitbucket

	insinto usr/lib/gitbucket
	doins target/executable/gitbucket.war

	insinto usr/lib/systemd/system
	doins "${FILESDIR}/gitbucket.service"
}
