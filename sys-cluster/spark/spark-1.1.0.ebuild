# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
JAVA_PKG_IUSE="doc examples source"
JAVA_ANT_DISABLE_ANT_CORE_DEP="yes"

inherit eutils	autotools versionator multilib flag-o-matic

DESCRIPTION="Spark supports cyclic data flows and in-memory computing"
HOMEPAGE="http://spark.apache.org/"

SRC_URI="http://apache.org/dist/${PN}/${P}/${P}.tgz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="java python scala"

RDEPEND="python? ( dev-lang/python dev-python/boto )
		>=virtual/jre-1.6
		net-misc/curl
		dev-libs/cyrus-sasl"
DEPEND=">=virtual/jdk-1.6
		dev-lang/scala
		dev-java/maven-bin
		${RDEPEND}"

#S="${WORKDIR}/${P}"

#ECONF_SOURCE="${S}"

#src_prepare() {
#	 mkdir "${S}/build" || die " making dir problem"
#}

src_compile() {
	#cd "${S}"
	#./sbt/sbt assembly || die "assembly build failed"
	./make-distribution.sh --tgz || die "problem with make-distribution.sh"
}

src_install() {
	#cd "${S}/build"
	#emake DESTDIR="${D}" install || die "emake install failed"
	cp -r ${WORKDIR}/dist ${D}
}

