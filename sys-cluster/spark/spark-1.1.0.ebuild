# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
JAVA_PKG_IUSE="doc examples source"
JAVA_ANT_DISABLE_ANT_CORE_DEP="yes"

inherit eutils  autotools versionator multilib flag-o-matic 

MY_PV=${PV/_/}

DESCRIPTION="Spark supports cyclic data flows and in-memory computing"
HOMEPAGE="http://spark.apache.org/"

SRC_URI="http://www.apache.org/dist/spark/spark-1.1.0/${P}.tgz" 

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="java python scala"

DEPEND="net-misc/curl
        dev-libs/cyrus-sasl
		python? ( dev-lang/python dev-python/boto )
		java? ( virtual/jdk )
		scala? ( dev-lang/scala )
		dev-java/maven-bin "

RDEPEND=" python? ( dev-lang/python )
		  >=virtual/jdk-1.6
		  scala? ( dev-lang/scala )
		  dev-java/maven-bin
		${DEPEND}"

S="${WORKDIR}/${P}"

ECONF_SOURCE="${S}"

src_prepare() {
    mkdir "${S}/build" || die " making dir problem"
}

src_compile() {
    cd "${S}"
	./sbt/sbt assembly || die "assembly build failed"
	./make-distribution.sh || die "problem with make-distribution.sh"
}

src_install() {
    cd "${S}/build"
    emake DESTDIR="${D}" install || die "emake install failed"
}

