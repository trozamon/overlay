# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Lightning-fast unified analytics engine"
HOMEPAGE="http://spark.apache.org"
SRC_URI="mirror://apache/spark/spark-${PV}/spark-${PV}-bin-hadoop2.7.tgz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="virtual/jre:1.8"
DEPEND="${RDEPEND}"

S="${WORKDIR}/spark-${PV}-bin-hadoop2.7"

src_install() {
	dodir usr/lib/spark
	into usr/lib/spark

	dobin bin/beeline \
		bin/find-spark-home \
		bin/pyspark \
		bin/spark-class \
		bin/spark-shell \
		bin/spark-sql \
		bin/spark-submit

	insinto usr/lib/spark/bin
	doins bin/load-spark-env.sh

	insinto usr/lib/spark
	doins LICENSE NOTICE README.md RELEASE
	doins -r conf
	doins -r jars
	doins -r python
	doins -r sbin
	doins -r yarn

	dosym /usr/lib/spark/bin/beeline usr/bin/beeline
	dosym /usr/lib/spark/bin/pyspark usr/bin/pyspark
	dosym /usr/lib/spark/bin/spark-class usr/bin/spark-class
	dosym /usr/lib/spark/bin/spark-shell usr/bin/spark-shell
	dosym /usr/lib/spark/bin/spark-sql usr/bin/spark-sql
	dosym /usr/lib/spark/bin/spark-submit usr/bin/spark-submit

	doenvd "${FILESDIR}"/99spark
}
