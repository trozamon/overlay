# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A backup tool, based on git's packfile format"
HOMEPAGE="https://bup.github.io"
SRC_URI="https://github.com/bup/bup/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/pyxattr[${PYTHON_USEDEP}]
dev-python/fuse-python[${PYTHON_USEDEP}]
dev-python/pylibacl[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	emake install PREFIX=/usr DESTDIR="${D}"
}
