import QtQuick 2.15

Rectangle {
    anchors.fill: parent
    color: "black"  // fallback color
    opacity: 0.0

    // Fade-in animation for the entire splash
    SequentialAnimation on opacity {
        running: true
        loops: 1
        NumberAnimation {
            from: 0.0
            to: 1.0
            duration: 900 // Breeze uses around 900ms
            easing.type: Easing.InOutQuad
        }
    }

    // Background image
    Image {
        id: background
        source: "images/background.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
    }

    // Semi-transparent black overlay
    Rectangle {
        anchors.fill: parent
        color: "#80000000" // 50% opaque black (ARGB: 80=128/255 alpha)
    }

    // Logo
    Image {
        id: logo
        source: "images/logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 500
        height: 500
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    // Spinner
    Image {
        id: busyIndicator
        source: "images/busywidget.svgz"
        width: 64
        height: 64
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: logo.bottom
        anchors.topMargin: 0

        RotationAnimator on rotation {
            from: 0
            to: 360
            duration: 1500
            loops: Animation.Infinite
            running: true
        }
    }
}
