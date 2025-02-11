pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtMultimedia
import Student 1.0

Window {

    maximumWidth: 1560;
    minimumWidth: 1560
    maximumHeight: 720;
    minimumHeight: 720;
    width: 1560;
    height: 720;
    visible: true;
    title: qsTr("Blue Archive");
    id: mainba;
    property bool rdCga10:false;
    property bool isMouseMoveEnable:false;
    property bool cansign:false;
    property bool dynamicswap:true;
    property real startX;
    property real startY;
    property real stopX;
    property real stopY;
    property int res;
    property int stuNumber:0;
    property int times10:10;
    property var resVec: [0,0,0,0,0,0,0,0,0,1];

    SoundEffect{
        id:gachi_btn_SE;
        source: "file:resource/SE/confirm.wav";
    }

    SoundEffect{
        id:gachi_gaching_bgm;
        source: "file:resource/music/ConnectedSky.wav";
        loops: SoundEffect.Infinite;
    }

    Rdstu{
        id:rdstu_eng;
        level:0;
        index:0;
    }
    StackView {
        id: stack;
        anchors.fill: parent;
        initialItem: start_lobby;
    }
    AudioOutput{
        id:ba_otherPlayer;
    }
    Component {
        id: start_lobby;
        Rectangle{
            MediaPlayer{
                id:ba_logoplayer;
                autoPlay: true;
                source: "file:resource/video/title.mp4";
                loops: -1;
                videoOutput: ba_logoplayershow;
            }
            VideoOutput{
                id:ba_logoplayershow;
                anchors.fill: parent;
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        logoimg.visible = false;
                        logopressshow.visible = false;
                        ba_login_hello.play();
                    }
                }
            }
            /*
            SoundEffect{
                id:ba_login_hello;
                source: "file:resource/voice/"+rdstu_eng.randomVoiceFile("resource/voice");
                onPlayingChanged: {
                    if (!playing){
                        stack.replace(stack.currentItem, gachipre);
                    }
                }
            }
            */
            MediaPlayer{
                id:ba_login_hello;
                source: "file:resource/voice/"+rdstu_eng.randomVoiceFile("resource/voice");
                audioOutput: ba_otherPlayer;
                onMediaStatusChanged: {
                    if (mediaStatus == MediaPlayer.EndOfMedia){
                        stack.replace(stack.currentItem, gachipre);
                    }
                }
            }

            SoundEffect{
                id:ba_logo_music;
                source: "file:resource/music/ConstantModerato.wav";
                loops: SoundEffect.Infinite;
            }
            Image {
                width: 288.67;
                height: 110;
                x: 128;
                y: 20;
                id: logoimg;
                visible: true;
                source: "file:resource/pictures/base/logo.png";
            }
            Rectangle {
                id: logopressshow;
                width: 780;
                height: 36;
                x: 390;
                y: 600;
                color: "#ffdcdcdc";
                ColorAnimation {
                    id: logopressshowbg;
                    target: logopressshow;
                    property: "color"
                    from: "#ffdcdcdc"
                    to: "#00dcdcdc";
                    duration: 2500;
                    loops: -1;
                    running: true;
                }
                Text {
                    color: "#ff6487bf";
                    anchors.centerIn: parent;
                    font.bold: true;
                    font.pointSize: 16;
                    id: logopresstext;
                    visible: true;
                    text: "TOUCH TO START";
                    ColorAnimation {
                        id: logopressshowtxbg;
                        target: logopresstext;
                        property: "color"
                        from: "#ff6487bf"
                        to: "#006487bf";
                        duration: 2500;
                        loops: -1;
                        running: true;
                    }
                }
            }
            Component.onCompleted: {
                rdstu_eng.initialisation("resource/students.json");
                ba_logo_music.play();
            }
        }
    }

    Component {
        id: gachipre;
        Rectangle{
            id: gachipre_r;
            MediaPlayer{
                id:ba_gachiplayer;
                source: "file:resource/video/gacha_banner.mp4";
                loops: -1;
                videoOutput: ba_gachiplayershow;
                autoPlay: true;
            }
            VideoOutput{
                id:ba_gachiplayershow
                width: 886;
                height: 720;
            }
            Image {
                visible: true;
                anchors.fill: parent
                source: "file:resource/pictures/background/pre_gachi.png";
            }
            Image {
                x: 85.3;
                y: 8;
                width: 70;
                height: 70;
                id: backlogoimg;
                visible: true;
                source: "file:resource/pictures/base/back.png";
                NumberAnimation {
                    id: backlogoimg_effect;
                    target: backlogoimg
                    property: "scale"
                    easing.type: Easing.InQuad
                    duration: 100
                    to: 0.85;
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (!gachi_infoimgshow.visible){
                            gachi_btn_SE.play();
                            gachi_gaching_bgm.stop();
                            stack.replace(stack.currentItem, start_lobby);
                        }
                    }
                    onPressed:{
                        if (!gachi_infoimgshow.visible){
                            backlogoimg_effect.start();
                        }
                    }
                    onReleased:{
                        backlogoimg_effect.stop();
                        backlogoimg.scale = 1;
                    }
                }
            }
            Image {
                x: 1094;
                y: 492;
                width: 346;
                height: 103;
                id: gachi_10_confirmimg;
                visible: true;
                source: "file:resource/pictures/base/10ga.png";
                NumberAnimation {
                    id: gachi_10_confirmimg_effect;
                    target: gachi_10_confirmimg
                    property: "scale"
                    easing.type: Easing.InQuad
                    duration: 100
                    to: 0.85;
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(!gachi_infoimgshow.visible){
                            gachi_btn_SE.play();
                            gachi_infoimgshow.visible = true;
                            mainba.rdCga10 = true;
                        }
                    }
                    onPressed:{
                        if(!gachi_infoimgshow.visible){
                            gachi_10_confirmimg_effect.start();
                        }
                    }
                    onReleased:{
                        gachi_10_confirmimg_effect.stop();
                        gachi_10_confirmimg.scale = 1;
                    }
                }
            }
            Image {
                x: 765;
                y: 492;
                width: 323;
                height: 103;
                id: gachi_1_confirmimg;
                visible: true;
                source: "file:resource/pictures/base/1ga.png";
                NumberAnimation {
                    id: gachi_1_confirmimg_effect;
                    target: gachi_1_confirmimg
                    property: "scale"
                    easing.type: Easing.InQuad
                    duration: 100
                    to: 0.85;
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(!gachi_infoimgshow.visible){
                            gachi_btn_SE.play();
                            gachi_infoimgshow.visible = true;
                            mainba.rdCga10 = false;
                        }
                    }
                    onPressed:{
                        if(!gachi_infoimgshow.visible){
                            gachi_1_confirmimg_effect.start();
                        }
                    }
                    onReleased:{
                        gachi_1_confirmimg_effect.stop();
                        gachi_1_confirmimg.scale = 1;
                    }
                }
            }
            Rectangle {
                id: gachi_infoimgshow;
                visible: false;
                x:465;
                y:109.5;
                width: 630;
                height: 501;
                color: "transparent";
                Image {
                    id: gachi_infoimg;
                    visible: true;
                    anchors.fill: parent
                    source: "file:resource/pictures/base/freeyobi.png";
                }
                Rectangle {
                    id: gachi_pre_confirm;
                    x: 322;
                    y: 376;
                    width: 275;
                    height: 82;
                    color: "transparent";
                    Image {
                        id: gachi_pre_confirmimg;
                        visible: true;
                        anchors.fill: parent
                        source: "file:resource/pictures/base/confirm.png";
                        NumberAnimation {
                            id: gachi_pre_confirmimg_effect;
                            target: gachi_pre_confirmimg
                            property: "scale"
                            easing.type: Easing.InQuad
                            duration: 100
                            to: 0.85;
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            gachi_infoimgshow.visible = false;
                            gachi_btn_SE.play();
                            stack.replace(stack.currentItem,gachiplay);
                        }
                        onPressed:{
                            gachi_pre_confirmimg_effect.start();
                        }
                        onReleased:{
                            gachi_pre_confirmimg_effect.stop()
                            gachi_pre_confirmimg.scale = 1;
                        }
                    }
                }
                Rectangle {
                    id: gachi_pre_cancel;
                    x: 37;
                    y: 376;
                    width: 275;
                    height: 81;
                    color: "transparent";
                    Image {
                        id: gachi_pre_cancelimg;
                        visible: true;
                        anchors.fill: parent
                        source: "file:resource/pictures/base/cancel.png";
                        NumberAnimation {
                            id: gachi_pre_cancelimg_effect;
                            target: gachi_pre_cancelimg
                            property: "scale"
                            easing.type: Easing.InQuad
                            duration: 100
                            to: 0.85;
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            gachi_btn_SE.play();
                            gachi_infoimgshow.visible = false;
                        }
                        onPressed:{
                            gachi_pre_cancelimg_effect.start();
                        }
                        onReleased:{
                            gachi_pre_cancelimg_effect.stop()
                            gachi_pre_cancelimg.scale = 1;
                        }
                    }
                }
                Rectangle {
                    id: gachi_pre_exit;
                    x: 579;
                    y: 19;
                    width: 31;
                    height: 31;
                    color: "transparent";
                    Image {
                        id: gachi_pre_exitimg;
                        visible: true;
                        anchors.fill: parent
                        source: "file:resource/pictures/base/exit.png";
                        NumberAnimation {
                            id: gachi_pre_exitimg_effect;
                            target: gachi_pre_exitimg
                            property: "scale"
                            easing.type: Easing.InQuad
                            duration: 100
                            to: 0.8;
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            gachi_btn_SE.play();
                            gachi_infoimgshow.visible = false;
                        }
                        onPressed:{
                            gachi_pre_exitimg_effect.start();
                        }
                        onReleased:{
                            gachi_pre_exitimg_effect.stop()
                            gachi_pre_exitimg.scale = 1;
                        }
                    }
                }
            }
            Component.onCompleted: {
                if (!gachi_gaching_bgm.playing){
                    gachi_gaching_bgm.play();
                }
            }
        }
    }

    Component {
        id: gachiplay;
        Rectangle{
            MediaPlayer{
                id: sign_over_player;
                source: "file:resource/video/gachi_aft.mp4";
                onMediaStatusChanged: {
                    if (mediaStatus == MediaPlayer.EndOfMedia){
                        if (mainba.rdCga10){
                            mainba.times10 = 9;
                            for (var i = 0;i <= mainba.times10;++i){
                                mainba.resVec[i] = mainba.getRs();
                            }
                            stack.replace(stack.currentItem, gachi10_start);
                        }else{
                            mainba.times10 = 0;
                            mainba.resVec[mainba.times10] = mainba.getRs();
                            stack.replace(stack.currentItem, gachi1_start);
                        }
                    }
                }
            }
            MediaPlayer{
                id: sign_player;
                source: "file:resource/video/sign.mp4"
                loops: -1;
                //videoOutput: gachiplay_playershow;
            }
            MediaPlayer{
                id:gachiplay_player;
                source: mainba.rdCga10 ? "file:resource/video/gachi_pre10.mp4" : "file:resource/video/gachi_pre1.mp4";
                videoOutput: gachiplay_playershow;
                autoPlay: true;
                onMediaStatusChanged:{
                    if (mediaStatus == MediaPlayer.EndOfMedia){
                        sign_player.videoOutput = gachiplay_playershow;
                        sign_player.play();
                        mainba.cansign = true;
                    }
                }
            }
            VideoOutput{
                id:gachiplay_playershow
                width: 1560;
                height: 720;
            }
            SoundEffect{
                id:gachiplay_music;
                source: "file:resource/SE/SE01.wav";
            }
            Canvas{
                id:signpaint;
                x:524;
                y:428;
                width:516;
                height:225;
                onPaint: {
                    if (mainba.cansign){
                        var ctx = getContext("2d");
                        ctx.lineWidtn = 8;
                        ctx.strokeStyle = "black";
                        ctx.beginPath();
                        ctx.moveTo(mainba.startX,mainba.startY);
                        mainba.startX = signpaintarea.mouseX;
                        mainba.startY = signpaintarea.mouseY;
                        ctx.lineTo(mainba.startX,mainba.startY);
                        ctx.stroke();
                    }
                }
            }
            MouseArea{
                id:signpaintarea;
                x:524;
                y:428;
                width:516;
                height:225
                onPressed: function(mouse) {
                    if (mainba.cansign){
                        mainba.startX = mouse.x;
                        mainba.startY = mouse.y;
                        mainba.isMouseMoveEnable = true
                    }
                }
                onReleased: {
                    if (mainba.cansign){
                        mainba.isMouseMoveEnable = false
                        signpaint.requestPaint();
                        mainba.cansign = false;
                        signpaint.visible = false;
                        sign_player.stop();
                        sign_over_player.videoOutput = gachiplay_playershow;
                        sign_over_player.play();
                    }
                }
                onPositionChanged: {
                    if (mainba.isMouseMoveEnable && mainba.cansign){
                        signpaint.requestPaint()
                    }
                }
            }
            Component.onCompleted: {
                gachiplay_music.play();
            }
        }
    }
    function getRs(){
        mainba.res = rdstu_eng.rand(600);
        if (mainba.res <= 470){
            return 0;
        }else if (mainba.res >= 488){
            return 1;
        }
        else{
            return 2;
        }
    }
    Component{
        id: gachi10_start;
        Rectangle{
            MediaPlayer{
                id:gachi10_startplayer;
                videoOutput: gachi10_startplayershow;
                source: "file:resource/video/gachi10_show.mp4";
                autoPlay: true;
                onMediaStatusChanged: {
                    if (mediaStatus == MediaPlayer.EndOfMedia){
                        stack.push(gachi1_start);
                    }
                }
            }
            VideoOutput{
                anchors.fill:parent;
                id:gachi10_startplayershow;
            }
            SoundEffect{
                id:gachi10_SE1;
            }
            SoundEffect{
                id:gachi10_SE2;
            }
            SoundEffect{
                id:gachi10_SE3;
            }
            SoundEffect{
                id:gachi10_SE4;
            }
            SoundEffect{
                id:gachi10_SE5;
            }
            SoundEffect{
                id:gachi10_SE6;
            }
            SoundEffect{
                id:gachi10_SE7;
            }
            SoundEffect{
                id:gachi10_SE8;
            }
            SoundEffect{
                id:gachi10_SE9;
            }
            SoundEffect{
                id:gachi10_SE10;
            }
            Rectangle{
                anchors.fill: parent;
                color: "transparent";
                ParallelAnimation{
                    property int perImg: 1;
                    property string sourcePath:"file:resource/SE/Result_R.wav";
                    id: res_eff;
                    running: true;
                    NumberAnimation {id:res_eff_move_x; target: res1;	property: "x"; to:352; duration: 260 }
                    NumberAnimation {id:res_eff_move_y; target: res1;	property: "y"; to:129; duration: 260 }
                    NumberAnimation {id:res_eff_scale; target: res1; property: "scale"; to:0.37; duration: 260}
                    onStarted: {
                        switch (mainba.resVec[res_eff.perImg]){
                            case 0:
                                sourcePath = "file:resource/SE/Result_R.wav";
                            break;
                            case 1:
                                sourcePath = "file:resource/SE/Result_SR.wav";
                            break
                            case 2:
                                sourcePath = "file:resource/SE/Result_SSR.wav";
                            break;
                        }
                        switch (res_eff.perImg){
                            case 1:
                                gachi10_SE1.source = sourcePath;
                                gachi10_SE1.play();
                                break;
                            case 2:
                                gachi10_SE2.source = sourcePath;
                                gachi10_SE2.play();
                                break;
                            case 3:
                                gachi10_SE3.source = sourcePath;
                                gachi10_SE3.play();
                                break;
                            case 4:
                                gachi10_SE4.source = sourcePath;
                                gachi10_SE4.play();
                                break;
                            case 5:
                                gachi10_SE5.source = sourcePath;
                                gachi10_SE5.play();
                                break;
                            case 6:
                                gachi10_SE6.source = sourcePath;
                                gachi10_SE6.play();
                                break;
                            case 7:
                                gachi10_SE7.source = sourcePath;
                                gachi10_SE7.play();
                                break;
                            case 8:
                                gachi10_SE8.source = sourcePath;
                                gachi10_SE8.play();
                                break;
                            case 9:
                                gachi10_SE9.source = sourcePath;
                                gachi10_SE9.play();
                                break;
                            case 10:
                                gachi10_SE10.source = sourcePath;
                                gachi10_SE10.play();
                                break;
                        }
                        ++perImg;
                    }
                    onFinished: {
                        switch (res_eff.perImg){
                            case 2:
                            {
                                res_eff_move_x.to = 521;
                                res_eff_move_y.to = 129;

                                res_eff_move_x.target = res2;
                                res_eff_move_y.target = res2;
                                res_eff_scale.target = res2;

                                res2.visible = true;
                            }
                            break;
                            case 3:
                            {
                                res_eff_move_x.to = 690;
                                res_eff_move_y.to = 129;

                                res_eff_move_x.target = res3;
                                res_eff_move_y.target = res3;
                                res_eff_scale.target = res3;

                                res3.visible = true;
                            }
                            break;
                            case 4:
                            {
                                res_eff_move_x.to = 859;
                                res_eff_move_y.to = 129;

                                res_eff_move_x.target = res4;
                                res_eff_move_y.target = res4;
                                res_eff_scale.target = res4;

                                res4.visible = true;
                            }
                            break;
                            case 5:
                            {
                                res_eff_move_x.to = 1028;
                                res_eff_move_y.to = 129;

                                res_eff_move_x.target = res5;
                                res_eff_move_y.target = res5;
                                res_eff_scale.target = res5;

                                res5.visible = true;
                            }
                            break;
                            case 6:
                            {
                                res_eff_move_x.to = 352;
                                res_eff_move_y.to = 411;

                                res_eff_move_x.target = res6;
                                res_eff_move_y.target = res6;
                                res_eff_scale.target = res6;


                                res6.visible = true;
                            }
                            break;
                            case 7:
                            {
                                res_eff_move_x.to = 521;
                                res_eff_move_y.to = 411;

                                res_eff_move_x.target = res7;
                                res_eff_move_y.target = res7;
                                res_eff_scale.target = res7;

                                res7.visible = true;
                            }
                            break;
                            case 8:
                            {
                                res_eff_move_x.to = 690;
                                res_eff_move_y.to = 411;

                                res_eff_move_x.target = res8;
                                res_eff_move_y.target = res8;
                                res_eff_scale.target = res8;

                                res8.visible = true;
                            }
                            break;
                            case 9:
                            {
                                res_eff_move_x.to = 859;
                                res_eff_move_y.to = 411;

                                res_eff_move_x.target = res9;
                                res_eff_move_y.target = res9;
                                res_eff_scale.target = res9;

                                res9.visible = true;
                            }
                            break;
                            case 10:
                            {
                                res_eff_move_x.to = 1028;
                                res_eff_move_y.to = 411;

                                res_eff_move_x.target = res10;
                                res_eff_move_y.target = res10;
                                res_eff_scale.target = res10;
                                white_cover_eff.start();

                                res10.visible = true;
                            }
                            break;
                            case 11:
                            {
                                return;
                            }
                        }
                        start();
                    }
                }
                Image{
                    id:res1;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[9])+".png";
                    x:312;
                    y:0;
                    transformOrigin: Item.TopLeft;
                }
                Image{
                    id: res2;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[8])+".png";
                    visible:false;
                    x:624;
                    y:0;
                    transformOrigin: Item.TopLeft;
                }
                Image{
                    id: res3;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[7])+".png";
                    visible:false;
                    x:936;
                    y:0;
                    transformOrigin: Item.TopLeft;
                }
                Image{
                    id: res4;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[6])+".png";
                    visible:false;
                    x:1248;
                    y:0;
                    transformOrigin: Item.TopLeft;
                }
                Image{
                    id: res5;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[5])+".png";
                    visible:false;
                    x:1560;
                    y:0;
                    transformOrigin: Item.TopLeft;
                }
                Image{
                    id: res6;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[4])+".png";
                    visible:false;
                    x:316;
                    y:720
                    transformOrigin: Item.TopLeft;
                }
                Image{
                    id: res7;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[3])+".png";
                    visible:false;
                    x:624;
                    y:720
                    transformOrigin: Item.TopLeft;
                }
                Image{
                    id: res8;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[2])+".png";
                    visible:false;
                    x:936;
                    y:720
                    transformOrigin: Item.TopLeft;
                }
                Image{
                    id: res9;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[1])+".png";
                    visible:false;
                    x:1248;
                    y:720
                    transformOrigin: Item.TopLeft;
                }
                Image{
                    id: res10;
                    source:"file:resource/pictures/cards/"+(mainba.resVec[0])+".png";
                    visible:false;
                    x:1560;
                    y:720
                    transformOrigin: Item.TopLeft;
                }
            }
            Rectangle{
                id:white_cover
                anchors.fill: parent;
                color: "white";
                opacity: 0;
                NumberAnimation {
                    id: white_cover_eff
                    target: white_cover
                    property: "opacity"
                    to:1;
                    duration: 600
                    easing.type: Easing.InQuad
                }
            }
            Component.onCompleted: {
                gachi10_SE1.play();
            }
        }
    }
    Component{
        id: gachi1_start;
        Rectangle{
            width: 1560;
            height: 720;
            MediaPlayer{
                id:gachi1_startplayer;
                videoOutput: gachi1_startplayershow;
                onMediaStatusChanged: {
                    if (mediaStatus == MediaPlayer.EndOfMedia){
                        subinfo.visible = true;
                        subinfo_effect.start();
                        subbg.visible = true;
                        whiteanim.visible = true;
                        whiteanim_effect.start();
                        dynamicshow_img1.visible = true;
                        dynamicshow_img1_effect1.start();
                        skip1.enabled = true;

                        stu_name.visible = true;
                        stu_introduction.visible = true;
                        stu_school.visible = true;
                        stu_club.visible = true;
                        stu_armytype.visible = true;
                        stu_weapon.visible = true;
                        stu_birthday.visible = true;
                        stu_academy.visible = true;
                        stu_portrait.visible = true;
                        stu_voice.play();
                    }
                }
            }
            VideoOutput{
                anchors.fill:parent;
                id:gachi1_startplayershow
            }
            SoundEffect{
                id:gachi1_start_music;
                source: "file:resource/SE/normal_show.wav";
            }
            Rectangle{
                anchors.fill: parent;
                color: "transparent";
                MediaPlayer{
                    id:stu_voice;
                    audioOutput: ba_otherPlayer;
                }
                Image{
                    anchors.fill: parent;
                    id: subbg;
                    visible:false;
                }
                Image{
                    id: dynamicshow_img1;
                    source: "file:resource/pictures/background/tri0.png";
                    visible:false;
                    NumberAnimation {
                        id: dynamicshow_img1_effect1;
                        target: dynamicshow_img1
                        property: "opacity"
                        duration: 1000
                        to: 1;
                        onFinished: {
                            dynamicshow_img1_effect2.start();
                        }
                    }
                    NumberAnimation {
                        id: dynamicshow_img1_effect2;
                        target: dynamicshow_img1
                        property: "opacity"
                        duration: 1000
                        to: 0;
                        onFinished: {
                            dynamicshow_img1_effect1.start();
                            dynamicshow_img1.source = "file:resource/pictures/background/tri"+Number(mainba.dynamicswap)+".png";
                            mainba.dynamicswap = !mainba.dynamicswap;
                        }
                    }
                }
                Image{
                    id: stu_portrait;
                    visible: false;
                    anchors.centerIn:parent;
                }
                Image{
                    anchors.fill: parent;
                    id: subinfo;
                    visible:false;
                    source: "file:resource/pictures/background/star"+Number(mainba.resVec[mainba.times10] + 1)+".png";
                    NumberAnimation {
                        id: subinfo_effect;
                        target: subinfo
                        property: "opacity"
                        easing.type: Easing.InQuad
                        duration: 150
                        to: 1;
                    }
                }
                Text{
                    color: "white"
                    x:256
                    y:480
                    font.bold: true;
                    font.italic: true
                    font.pointSize: 32;
                    id: stu_name;
                    visible: false;
                }
                Rectangle{
                    x:228;
                    y:566;
                    width: 506;
                    height: 56;
                    color: "transparent";
                    Text{
                        anchors.fill: parent
                        color: "#556483"
                        font.bold: true;
                        font.pointSize: 14;
                        id: stu_introduction;
                        visible: false;
                    }
                }
                Rectangle{
                    x:980;
                    y:207;
                    transform: Rotation { angle: -2.8}
                    transformOrigin: Item.TopLeft;
                    Rectangle{
                        x:120;
                        y:18;
                        width: 230
                        height: 60;
                        color: "transparent";
                        Text{
                            anchors.fill: parent;
                            color: "black"
                            font.pointSize: 28;
                            id: stu_school;
                            visible: false;
                        }
                    }
                    Rectangle{
                        x:4;
                        y:125;
                        width: 360;
                        height: 50;
                        color: "transparent";
                        Text{
                            anchors.centerIn: parent;
                            color: "#556483"
                            font.pointSize: 18;
                            id: stu_club;
                            visible: false;
                        }
                    }
                    Rectangle{
                        x:4;
                        y:210;
                        width: 360;
                        height: 50;
                        color: "transparent";
                        Text{
                            anchors.centerIn: parent;
                            color: "#838055"
                            font.pointSize: 16;
                            id: stu_armytype;
                            visible: false;
                        }
                    }
                    Rectangle{
                        x:4;
                        y:295;
                        width: 360;
                        height: 50;
                        color: "transparent";
                        Text{
                            anchors.centerIn: parent;
                            color: "#556483"
                            font.pointSize: 18;
                            id: stu_weapon;
                            visible: false;
                        }
                    }
                    Rectangle{
                        x:4;
                        y:380;
                        width: 360;
                        height: 50;
                        color: "transparent";
                        Text{
                            anchors.centerIn: parent;
                            color: "#556483"
                            font.pointSize: 18;
                            id: stu_birthday;
                            visible: false;
                        }
                    }
                    Rectangle{
                        x:19;
                        y:19;
                        width: 88;
                        height: 55;
                        color: "transparent";
                        Image{
                            anchors.centerIn: parent;
                            anchors.fill: parent;
                            id: stu_academy;
                            visible: false;
                        }
                    }
                }
                Image{
                    id: whiteanim;
                    visible:false;
                    source: "file:resource/pictures/background/bar.png";
                    x:0;
                    NumberAnimation {
                        id: whiteanim_effect;
                        target: whiteanim
                        property: "x"
                        duration: 150
                        to: 1560;
                    }
                }
                MouseArea{
                    id:skip1;
                    enabled:false;
                    anchors.fill:parent;
                    onClicked:{
                        if (rdCga10 && mainba.times10 > 0){
                            mainba.times10 -= 1;
                            stack.replace(stack.currentItem, gachi1_start)
                        }
                        else{
                            stack.replace(stack.currentItem, gachipre);
                        }
                    }
                }
            }
            Component.onCompleted:{
                mainba.dynamicswap = true;
                whiteanim.x = 0;
                dynamicshow_img1.opacity = 0;
                dynamicshow_img1.visible = false;
                subinfo.visible = false;
                subbg.visible = false;
                whiteanim.visible = false;
                skip1.enabled = false;
                if (mainba.resVec[mainba.times10] === 0){
                    if (rdCga10){
                        gachi1_startplayer.source = "file:resource/video/blue.mp4";
                    }else{
                        gachi1_startplayer.source = "file:resource/video/single_blue.mp4";
                    }
                    subbg.source = "file:resource/pictures/background/Gacha_BG_R.png";
                }else if(mainba.resVec[mainba.times10] === 1){
                    if (rdCga10){
                        gachi1_startplayer.source = "file:resource/video/golden.mp4";
                    }else{
                        gachi1_startplayer.source = "file:resource/video/single_golden.mp4";
                    }
                    subbg.source = "file:resource/pictures/background/Gacha_BG_SR.png";
                }else{
                    if (rdCga10){
                        gachi1_startplayer.source = "file:resource/video/rainbow.mp4";
                    }else{
                        gachi1_startplayer.source = "file:resource/video/single_rainbow.mp4";
                    }
                    subbg.source = "file:resource/pictures/background/Gacha_BG_SSR.png";
                }
                gachi1_startplayer.play();
                gachi1_start_music.play();
                rdstu_eng.level = mainba.resVec[mainba.times10];
                if (rdstu_eng.getSize() > 0){
                    mainba.stuNumber = rdstu_eng.rand(rdstu_eng.getSize());
                    rdstu_eng.index = mainba.stuNumber;
                    stu_name.text = rdstu_eng.getCur(0);
                    stu_introduction.text = rdstu_eng.getCur(1);
                    stu_school.text = rdstu_eng.getCur(2);
                    stu_club.text = rdstu_eng.getCur(3);
                    stu_armytype.text = rdstu_eng.getCur(4);
                    stu_weapon.text = rdstu_eng.getCur(5);
                    stu_birthday.text = rdstu_eng.getCur(6);
                    stu_academy.source = rdstu_eng.getCur(7);
                    stu_portrait.source = rdstu_eng.getCur(8);
                    stu_voice.source = rdstu_eng.getCur(9);
                }
            }
        }
    }
}
