# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

inherit ruby-fakegem eutils

DESCRIPTION="A JSON schema verifier"
HOMEPAGE="https://github.com/ruby-json-schema/json-schema"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/addressable"
