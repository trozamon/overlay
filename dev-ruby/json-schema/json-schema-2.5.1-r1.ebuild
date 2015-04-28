# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby20"

inherit ruby-fakegem eutils

DESCRIPTION="A JSON schema verifier"
HOMEPAGE="https://github.com/ruby-json-schema/json-schema"
SRC_URI="https://github.com/ruby-json-schema/json-schema/archive/v2.5.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/addressable"
