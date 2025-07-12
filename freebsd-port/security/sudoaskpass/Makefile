PORTNAME=	sudoaskpass
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0
CATEGORIES=	security

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Graphical sudo password prompt using GNUstep
WWW=		https://github.com/probonopd/sudoaskpass

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gnustep
USE_GNUSTEP=	base gui

USE_GITHUB=	yes
GH_ACCOUNT=	probonopd
GH_PROJECT=	sudoaskpass
GH_TAGNAME=	main

WRKSRC=		${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

PLIST_FILES=	bin/SudoAskPass

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/SudoAskPass

.include <bsd.port.mk>
