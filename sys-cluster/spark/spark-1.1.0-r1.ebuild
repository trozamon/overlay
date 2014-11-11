# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils versionator multilib flag-o-matic

DESCRIPTION="Spark supports cyclic data flows and in-memory computing"
HOMEPAGE="http://spark.apache.org/"

SRC_URI="http://apache.org/dist/${PN}/${P}/${P}.tgz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="python"

RDEPEND="python? ( dev-lang/python dev-python/boto )
		>=virtual/jre-1.6
		net-misc/curl
		dev-libs/cyrus-sasl"
DEPEND=">=virtual/jdk-1.6
		dev-java/maven-bin
		${RDEPEND}"

src_compile() {
	echo ${PV}
	./make-distribution.sh || die "Failed to compile Spark"
}

src_install() {
	exeinto /usr/bin
	doexe "${FILESDIR}"/"${PV}"/beeline
	doexe "${FILESDIR}"/"${PV}"/spark-class
	doexe "${FILESDIR}"/"${PV}"/spark-shell
	doexe "${FILESDIR}"/"${PV}"/spark-sql
	doexe "${FILESDIR}"/"${PV}"/spark-submit
	use python && doexe "${FILEDIR}"/"${PV}"/pyspark

	exeinto /etc/init.d
	doexe "${FILESDIR}"/"${PV}"/spark-master
	doexe "${FILESDIR}"/"${PV}"/spark-worker

	dodir /usr/lib/${P}
	cp -r dist/* "${D}"/usr/lib/${P}/
}

pkg_postinst() {
	ln -s /usr/lib/${P}/conf /etc/spark
	elog "You must create /etc/spark/spark-env.sh from"
	elog "/etc/spark/spark-env.sh.template before running Spark"
}
