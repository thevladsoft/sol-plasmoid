/*
 *   Copyright 2017 thevladsoft <thevladsoft2@gmail.com>
 *
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 */

import QtQuick 2.15;
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtQuick.Controls 1.4 as QtControls
import org.kde.plasma.plasmoid 2.0
import QtWebKit 3.0
import QtWebEngine 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1 as QtLayouts
import QtQuick.Controls.Styles 1.4

Item {
    id:root

    width: 350
    property var imagen:
    ["0094","0131","0171","0193","0211","0304","0335","1600","1700","HMIB","HMIIC","211193171"]
    
    property var resolutions:["256","512","1024","2048"]
//     ["latest_aia_94","latest_aia_131","latest_aia_171","latest_aia_193","latest_aia_211","latest_aia_304","latest_aia_335","latest_aia_1600","latest_aia_1700","latest_hmi_mgram","latest_hmi_igram"]
    
    property var lasttime: 0
    property var lastminute: 0
    property var imagenes: []
    property var alternator: 0
    
    
    Component.onCompleted:{
        root.imagenes[0] = sol0
        root.imagenes[1] = sol1
        root.imagenes[2] = sol2
        root.imagenes[3] = sol3
        root.imagenes[4] = sol4
        root.imagenes[5] = sol5
        root.imagenes[6] = sol6
        root.imagenes[7] = sol7
        root.imagenes[8] = sol8
        root.imagenes[9] = sol9
        root.imagenes[10] = sol10
        root.imagenes[11] = sol11
        
//         print("first"+root.imagenes[0])
        reloadimages(true)
        plasmoid.setAction('reload', i18n('Reload from source'), 'system-reboot');
        
        plasmoid.backgroundHints = plasmoid.configuration.background?"StandardBackground":"NoBackground"
        
    }
    

    
    function action_reload(){
        reloadimages(true)
    }
    
    Connections {
        target: plasmoid.configuration
        onResolutionChanged: reloadimages(true)
        onSourceChanged: {
            reloadimages(true)
            root.alternator = 0
        }
        onBackgroundChanged: {
            plasmoid.backgroundHints = plasmoid.configuration.background?"StandardBackground":"NoBackground"
        }
    }
    
    function reloadimages(load){
        if(plasmoid.configuration.source < root.imagen.length){
            for(var i = 0;i < root.imagen.length; i++){
                if(load){root.imagenes[i].source = ""}
                root.imagenes[i].opacity = 0.
//                 root.imagenes[i].visible = false
            }
            root.imagenes[plasmoid.configuration.source].source = "https://sdo.gsfc.nasa.gov/assets/img/latest/latest_"+root.resolutions[plasmoid.configuration.resolution-1]+"_"+ imagen[plasmoid.configuration.source]+".jpg"
//             root.imagenes[plasmoid.configuration.source].source = "https://umbra.nascom.nasa.gov/images/" + imagen[plasmoid.configuration.source] + (plasmoid.configuration.resolution==3?".gif":"_tn.gif")
//             root.imagenes[plasmoid.configuration.source].visible = true
            root.imagenes[plasmoid.configuration.source].opacity = 1.
        }else{
             for(var i = 0;i < root.imagen.length; i++){
                if(load){root.imagenes[i].source = ""}
                root.imagenes[i].opacity = 0.
//                 root.imagenes[i].visible = false
                root.imagenes[i].source = "https://sdo.gsfc.nasa.gov/assets/img/latest/latest_"+root.resolutions[plasmoid.configuration.resolution-1]+"_"+ imagen[i]+ ".jpg"
//                 root.imagenes[i].source = "https://umbra.nascom.nasa.gov/images/" + imagen[i] + (plasmoid.configuration.resolution==3?".gif":"_tn.gif")
            }
            root.imagenes[root.alternator].opacity = 1.
//             root.imagenes[root.alternator].visible = true
        }
    }
    
    Dialog{
        id: dialogo
        visible: false
        width: 800
        height: 600
        modality:  Qt.NonModal
        title: "The Sun now"
        standardButtons : StandardButton.Close/*|StandardButton.Reset*/
//         onRejected: {
//             // soldialog.source = ""
// //             if(plasmoid.configuration.middledirect){
// //                 web.url= root.realurl
// //             }else{
// //                 web.url= root.url
// //             }
//         }
        QtControls.ScrollView{
            id: scrolly
            width:dialogo.width-20
            height: dialogo.height-55
            WebEngineView{
                id: soldialog
        //         Component.onCompleted:{root.imagenes[0] = sol0;}
                 width: scrolly.width; height: scrolly.height
                //cache: false
                // fillMode: Image.PreserveAspectFit
                // source: ""
                url: root.imagenes[plasmoid.configuration.source].url
    //             Behavior on opacity{ 
    //                     NumberAnimation { duration: 700;easing.type:Easing.InExpo}
    //             }
    //             onOpacityChanged:{visible = opacity == 0?false:true}
                
            }
        }
        
//         onVisibleChanged: {
//             if(!dialogo.visible){
//                 soldialog.source = ""
//             }
//             else {
//                 if(plasmoid.configuration.source < root.imagen.length){
//                     soldialog.source = "https://umbra.nascom.nasa.gov/images/" + imagen[plasmoid.configuration.source] + ".gif"
//                 }else{
//                     soldialog.source = "https://umbra.nascom.nasa.gov/images/" + imagen[root.alternator] + ".gif"
//                 }
//             }
//         }
    }
    
    PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XVIII 94 Å
This channel is designed to study solar flares. It measures extremely hot temperatures around 6 million Kelvin (10.8 million F)."
            width: root.width
            height: root.height
            visible: parent.visible
        
    WebEngineView {
        id: sol0
        property var source: ""
//         Component.onCompleted:{root.imagenes[0] = sol0;}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        
        
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XX 131 Å
This channel is designed to study solar flares. It measures extremely hot temperatures around 10 million K (18 million F), as well as cool plasmas around 400,000 K (720,000 F)."
            width: root.width
            height: root.height
            visible: parent.visible    
    WebEngineView{
        id: sol1
        property var source: ""
//         Component.onCompleted:{root.imagenes[1] = sol1}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

      
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }  }
            PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe IX, X 171 Å
This channel is especially good at showing coronal loops - the arcs extending off of the Sun where plasma moves along magnetic field lines. The brightest spots seen here are locations where the magnetic field near the surface is exceptionally strong."
            width: root.width
            height: root.height
            visible: parent.visible
    WebEngineView{
        id: sol2
        property var source: ""
//         Component.onCompleted:{root.imagenes[2] = sol2}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

     
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }   }
            PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XII 193 Å
This channel highlights the outer atmosphere of the Sun - called the corona - as well as hot flare plasma. Hot active regions, solar flares, and coronal mass ejections will appear bright here. The dark areas - called coronal holes - are places where very little radiation is emitted, yet are the main source of solar wind particles."
            width: root.width
            height: root.height
            visible: parent.visible
    WebEngineView{
        id: sol3
        property var source: ""
//         Component.onCompleted:{root.imagenes[3] = sol3}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

     
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }   }
            PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XIV 211 Å
This channel highlights the active region of the outer atmosphere of the Sun - the corona. Active regions, solar flares, and coronal mass ejections will appear bright here. The dark areas - called coronal holes - are places where very little radiation is emitted, yet are the main source of solar wind particles."
            width: root.width
            height: root.height
            visible: parent.visible
    WebEngineView{
        id: sol4
        property var source: ""
//         Component.onCompleted:{root.imagenes[4] = sol4}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

    
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }    }
            PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in He II 304 Å Å
This channel is especially good at showing areas where cooler dense plumes of plasma (filaments and prominences) are located above the visible surface of the Sun. The bright areas show places where the plasma has a high density."
            width: root.width
            height: root.height
            visible: parent.visible
    WebEngineView{
        id: sol5
        property var source: ""
//         Component.onCompleted:{root.imagenes[5] = sol5}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

     
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }   }
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XVI 335 Å
This channel highlights the active region of the outer atmosphere of the Sun - the corona. Active regions, solar flares, and coronal mass ejections will appear bright here. The dark areas - or coronal holes - are places where very little radiation is emitted, yet are the main source of solar wind particles."
            width: root.width
            height: root.height
            visible: parent.visible    
    WebEngineView{
        id: sol6
        property var source: ""
//         Component.onCompleted:{root.imagenes[6] = sol6}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

    
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }    }
            PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in C IV and continuum around 1600 Å
This channel often shows a web-like pattern of bright areas that highlight places where bundles of magnetic fields lines are concentrated. However, small areas with a lot of field lines will appear black, usually near sunspots and active regions."
            width: root.width
            height: root.height
            visible: parent.visible
    WebEngineView{
        id: sol7
        property var source: ""
//         Component.onCompleted:{root.imagenes[7] = sol7}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

    
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }    }
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in continuum around 1700 Å
This channel often shows a web-like pattern of bright areas that highlight places where bundles of magnetic fields lines are concentrated. However, small areas with a lot of field lines will appear black, usually near sunspots and active regions."
            width: root.width
            height: root.height
            visible: parent.visible    
    WebEngineView{
        id: sol8
        property var source: ""
//         Component.onCompleted:{root.imagenes[8] = sol8}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

    
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }    }
        PlasmaCore.ToolTipArea {
            mainText: "False color  solar photospheric magnetogram
This image shows the magnetic field directions near the surface of the Sun. White and black areas indicate opposite magnetic polarities, with white showing north (outward) polarity and black showing south (inward) polarity."
            width: root.width
            height: root.height
            visible: parent.visible    
    WebEngineView{
        id: sol9
        property var source: ""
//         Component.onCompleted:{root.imagenes[9] = sol9}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

     
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }   }
        PlasmaCore.ToolTipArea {
            mainText: "False color  solar photospheric Intensitygram"
            width: root.width
            height: root.height
            visible: parent.visible    
    WebEngineView{
        id: sol10
        property var source: ""
//         Component.onCompleted:{root.imagenes[10] = sol10}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

    
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }    }
        PlasmaCore.ToolTipArea {
            mainText: "AIA Composite 211, 193, 171
This image combines three images with different, but very similar, temperatures. Each highlights a different part of the corona."
            width: root.width
            height: root.height
            visible: parent.visible    
     WebEngineView{
        id: sol11
        property var source: ""
//         Component.onCompleted:{root.imagenes[10] = sol10}
        width: root.width; height: root.height
        //cache: false
        // fillMode: Image.PreserveAspectFit
        // source: ""
        url: source
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}

    
        // onStatusChanged:{
        //     plasmoid.busy = true
        //     for(var i = 0;i < root.imagen.length; i++){
        //         if(root.imagenes[i].visible == true && (root.imagenes[i].status == Image.Ready || root.imagenes[i].status == Image.Error)){
        //             plasmoid.busy = false
        //         }
        //     }
        // }
    }    }
    
   QtControls.BusyIndicator {
       width: root.width
       height: root.height
       running: root.imagenes[plasmoid.configuration.source].loading
       visible: root.imagenes[plasmoid.configuration.source].loading 
    }
    
    MouseArea {
        anchors.fill: root
        acceptedButtons: Qt.MiddleButton
        onClicked: {
            // if(plasmoid.configuration.source < root.imagen.length){
            //     soldialog.source = "https://sdo.gsfc.nasa.gov/assets/img/latest/latest_"+root.resolutions[3]+"_"+ imagen[plasmoid.configuration.source]+".jpg"
            // }else{
            //     soldialog.source = "https://sdo.gsfc.nasa.gov/assets/img/latest/latest_"+root.resolutions[3]+"_"+ imagen[root.alternator]+ ".jpg"
            // }
            dialogo.visible = true
        }
    }
    

    
    PlasmaCore.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: "Local"
        interval: 1000
        onNewData: {
            
            if(root.lasttime == 0){
                root.lasttime = dataSource.data["Local"]["DateTime"]
            }
            else if(new Date(root.lasttime.getTime() + 1800000)<dataSource.data["Local"]["DateTime"]){
                root.lasttime = dataSource.data["Local"]["DateTime"]
                /****************/
                if (plasmoid.configuration.cleaner) {
                    clearcache.exec(plasmoid.configuration.cleanersize);
                }
                reloadimages(true)
            }
        }
    }
    
    PlasmaCore.DataSource {
        id: petitdataSource
        engine: "time"
        connectedSources: "Local"
        interval: 1000
        onNewData: {
            if(root.lastminute == 0){
                root.lastminute = petitdataSource.data["Local"]["DateTime"]
            }
            else if(new Date(root.lastminute.getTime() + 60000)<petitdataSource.data["Local"]["DateTime"] && plasmoid.configuration.source == root.imagen.length){
                root.lastminute = petitdataSource.data["Local"]["DateTime"]
                root.alternator = (root.alternator+1)%root.imagen.length
                reloadimages(false)
            }
        }
    }
    /***********/
    PlasmaCore.DataSource {
        id: clearcache
        engine: "executable"
        connectedSources: []
        onNewData: {
            disconnectSource(sourceName);}
        function exec(sizemb) {
            connectSource("[ $(du -sm $(kf5-config --path cache)/kio_http |cut -f1) -gt "+sizemb+" ] && $(kf5-config --path lib)/libexec/kf5/kio_http_cache_cleaner --clear-all");
        }
        
    }


  
  
}

