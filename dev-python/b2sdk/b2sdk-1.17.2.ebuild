# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="Backblaze B2 SDK"
HOMEPAGE="
	https://pypi.org/project/b2sdk/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/arrow
dev-python/logfury
dev-python/requests
dev-python/tqdm"

distutils_enable_tests pytest
