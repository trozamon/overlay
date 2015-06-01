# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

inherit ruby-fakegem eutils

DESCRIPTION="A ruby binding to libgit2"
HOMEPAGE="https://github.com/libgit2/rugged"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/libgit2"
