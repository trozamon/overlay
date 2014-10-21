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
		dev-lang/scala
		dev-java/maven-bin
		${RDEPEND}"

src_compile() {
	./make-distribution.sh || die "Failed to compile Spark"
}

src_install() {
	exeinto /usr/bin
	doexe dist/bin/beeline
	use python && doexe dist/bin/pyspark
	doexe dist/bin/spark-class
	doexe dist/bin/spark-shell
	doexe dist/bin/spark-sql
	doexe dist/bin/spark-submit

	insinto /etc/spark
	doins dist/conf/fairscheduler.xml.template
	doins dist/conf/log4j.properties.template
	doins dist/conf/metrics.properties.template
	doins dist/conf/spark-defaults.conf.template
	doins dist/conf/spark-env.sh.template

	exeinto /etc/init.d
	doexe "${FILESDIR}"/"${PV}"/spark-master
	doexe "${FILESDIR}"/"${PV}"/spark-worker

	dodir /usr/lib/${P}
	cp -r dist/lib "${D}"/usr/lib/${P}/lib
	use python && cp -r dist/python "${D}"/usr/lib/${P}/python
}

pkg_postinst() {
	elog "You must create /etc/spark/spark-env.sh from"
	elog "/etc/spark/spark-env.sh.template before running Spark"
}
