FROM alpine:3.19

RUN apk add --no-cache --update \
            cmake=3.27.8-r0 \
            g++ \
            gcc \
            make \
            doxygen \
            qt6-qtbase=6.6.1-r0 \
            qt6-qtbase-dev=6.6.1-r0 \
            qt6-qtdeclarative=6.6.1-r0 \
            qt6-qtdeclarative-dev=6.6.1-r0 \
            qt6-qtimageformats=6.6.1-r0 \
            qt6-qtimageformats-dev=6.6.1-r0 \
            qt6-qttools=6.6.1-r0 \
            qt6-qttranslations=6.6.1-r0 \
            python3 \
            qbs \
            openjdk17-jre-headless \
            py3-pip \
            gcovr \
            curl \
            unzip

RUN python3 -m venv /venv \
 && source /venv/bin/activate \
 && pip3 install "coverxygen==1.8.1"

ENV PATH=/venv/bin:$PATH \
    VIRTUAL_ENV=/venv

RUN qbs setup-toolchains --detect && qbs setup-qt /usr/bin/qmake6 qt-6 && qbs config defaultProfile qt-6

COPY sonar-scanner /opt/sonar-scanner/
RUN chmod a+x /opt/sonar-scanner/bin/sonar-scanner*

COPY qt6-tags/qdoc.tags               /usr/share/qt6/doc/qdoc/qdoc.tags
COPY qt6-tags/qmake.tags              /usr/share/qt6/doc/qmake/qmake.tags
COPY qt6-tags/qt3d.tags               /usr/share/qt6/doc/qt3d/qt3d.tags
COPY qt6-tags/qtconcurrent.tags       /usr/share/qt6/doc/qtconcurrent/qtconcurrent.tags
COPY qt6-tags/qtcore.tags             /usr/share/qt6/doc/qtcore/qtcore.tags
COPY qt6-tags/qtdbus.tags             /usr/share/qt6/doc/qtdbus/qtdbus.tags
COPY qt6-tags/qtgrpc.tags             /usr/share/qt6/doc/qtgrpc/qtgrpc.tags
COPY qt6-tags/qtgui.tags              /usr/share/qt6/doc/qtgui/qtgui.tags
COPY qt6-tags/qtlabsplatform.tags     /usr/share/qt6/doc/qtlabsplatform/qtlabsplatform.tags
COPY qt6-tags/qtlocation.tags         /usr/share/qt6/doc/qtlocation/qtlocation.tags
COPY qt6-tags/qtnetwork.tags          /usr/share/qt6/doc/qtnetwork/qtnetwork.tags
COPY qt6-tags/qtnetworkauth.tags      /usr/share/qt6/doc/qtnetworkauth/qtnetworkauth.tags
COPY qt6-tags/qtnfc.tags              /usr/share/qt6/doc/qtnfc/qtnfc.tags
COPY qt6-tags/qtopcua.tags            /usr/share/qt6/doc/qtopcua/qtopcua.tags
COPY qt6-tags/qtopengl.tags           /usr/share/qt6/doc/qtopengl/qtopengl.tags
COPY qt6-tags/qtpositioning.tags      /usr/share/qt6/doc/qtpositioning/qtpositioning.tags
COPY qt6-tags/qtprintsupport.tags     /usr/share/qt6/doc/qtprintsupport/qtprintsupport.tags
COPY qt6-tags/qtprotobuf.tags         /usr/share/qt6/doc/qtprotobuf/qtprotobuf.tags
COPY qt6-tags/qtqml.tags              /usr/share/qt6/doc/qtqml/qtqml.tags
COPY qt6-tags/qtqmlmodels.tags        /usr/share/qt6/doc/qtqmlmodels/qtqmlmodels.tags
COPY qt6-tags/qtqmltest.tags          /usr/share/qt6/doc/qtqmltest/qtqmltest.tags
COPY qt6-tags/qtquick.tags            /usr/share/qt6/doc/qtquick/qtquick.tags
COPY qt6-tags/qtquick3d.tags          /usr/share/qt6/doc/qtquick3d/qtquick3d.tags
COPY qt6-tags/qtquick3dphysics.tags   /usr/share/qt6/doc/qtquick3dphysics/qtquick3dphysics.tags
COPY qt6-tags/qtquickcontrols.tags    /usr/share/qt6/doc/qtquickcontrols/qtquickcontrols.tags
COPY qt6-tags/qtquickdialogs.tags     /usr/share/qt6/doc/qtquickdialogs/qtquickdialogs.tags
COPY qt6-tags/qtquicktimeline.tags    /usr/share/qt6/doc/qtquicktimeline/qtquicktimeline.tags
COPY qt6-tags/qtremoteobjects.tags    /usr/share/qt6/doc/qtremoteobjects/qtremoteobjects.tags
COPY qt6-tags/qtscxml.tags            /usr/share/qt6/doc/qtscxml/qtscxml.tags
COPY qt6-tags/qtsensors.tags          /usr/share/qt6/doc/qtsensors/qtsensors.tags
COPY qt6-tags/qtserialbus.tags        /usr/share/qt6/doc/qtserialbus/qtserialbus.tags
COPY qt6-tags/qtshadertools.tags      /usr/share/qt6/doc/qtshadertools/qtshadertools.tags
COPY qt6-tags/qtsql.tags              /usr/share/qt6/doc/qtsql/qtsql.tags
COPY qt6-tags/qtstatemachine.tags     /usr/share/qt6/doc/qtstatemachine/qtstatemachine.tags
COPY qt6-tags/qtsvg.tags              /usr/share/qt6/doc/qtsvg/qtsvg.tags
COPY qt6-tags/qttestlib.tags          /usr/share/qt6/doc/qttestlib/qttestlib.tags
COPY qt6-tags/qtwebchannel.tags       /usr/share/qt6/doc/qtwebchannel/qtwebchannel.tags
COPY qt6-tags/qtwebengine.tags        /usr/share/qt6/doc/qtwebengine/qtwebengine.tags
COPY qt6-tags/qtwebsockets.tags       /usr/share/qt6/doc/qtwebsockets/qtwebsockets.tags
COPY qt6-tags/qtwidgets.tags          /usr/share/qt6/doc/qtwidgets/qtwidgets.tags
COPY qt6-tags/qtxml.tags              /usr/share/qt6/doc/qtxml/qtxml.tags