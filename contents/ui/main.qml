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

import QtQuick 2.0;
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtQuick.Controls 1.4 as QtControls
import org.kde.plasma.plasmoid 2.0
import QtWebKit 3.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1 as QtLayouts
import QtQuick.Controls.Styles 1.4

Item {
    id:root

    width: 350
    property var imagen: ["latest_aia_94","latest_aia_131","latest_aia_171","latest_aia_193","latest_aia_211","latest_aia_304","latest_aia_335","latest_aia_1600","latest_aia_1700","latest_hmi_mgram","latest_hmi_igram"]
    
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
        
//         print("first"+root.imagenes[0])
        reloadimages(true)
    }
    
    Connections {
        target: plasmoid.configuration
        onResolutionChanged: reloadimages(true)
        onSourceChanged: {
            reloadimages(true)
            root.alternator = 0
        }
    }
    
    function reloadimages(load){
        if(plasmoid.configuration.source < root.imagen.length){
            for(var i = 0;i < root.imagen.length; i++){
                if(load){root.imagenes[i].source = ""}
                root.imagenes[i].opacity = 0.
//                 root.imagenes[i].visible = false
            }
            root.imagenes[plasmoid.configuration.source].source = "https://umbra.nascom.nasa.gov/images/" + imagen[plasmoid.configuration.source] + (plasmoid.configuration.resolution==3?".gif":"_tn.gif")
//             root.imagenes[plasmoid.configuration.source].visible = true
            root.imagenes[plasmoid.configuration.source].opacity = 1.
        }else{
             for(var i = 0;i < root.imagen.length; i++){
                if(load){root.imagenes[i].source = ""}
                root.imagenes[i].opacity = 0.
//                 root.imagenes[i].visible = false
                root.imagenes[i].source = "https://umbra.nascom.nasa.gov/images/" + imagen[i] + (plasmoid.configuration.resolution==3?".gif":"_tn.gif")
            }
            root.imagenes[root.alternator].opacity = 1.
//             root.imagenes[root.alternator].visible = true
        }
    }
    
    
    Image{
        id: sol0
//         Component.onCompleted:{root.imagenes[0] = sol0;}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XVIII 94 Å"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    
    Image{
        id: sol1
//         Component.onCompleted:{root.imagenes[1] = sol1}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XX 131 Å"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    Image{
        id: sol2
//         Component.onCompleted:{root.imagenes[2] = sol2}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe IX, X 171 Å"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    Image{
        id: sol3
//         Component.onCompleted:{root.imagenes[3] = sol3}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XII 193 Å"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    Image{
        id: sol4
//         Component.onCompleted:{root.imagenes[4] = sol4}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XIV 211 Å"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    Image{
        id: sol5
//         Component.onCompleted:{root.imagenes[5] = sol5}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in He II 304 Å Å"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    Image{
        id: sol6
//         Component.onCompleted:{root.imagenes[6] = sol6}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in Fe XVI 335 Å"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    Image{
        id: sol7
//         Component.onCompleted:{root.imagenes[7] = sol7}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in C IV and continuum around 1600 Å"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    Image{
        id: sol8
//         Component.onCompleted:{root.imagenes[8] = sol8}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color image of the Sun in continuum around 1700 Å"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    Image{
        id: sol9
//         Component.onCompleted:{root.imagenes[9] = sol9}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color  solar photospheric magnetogram"
            width: root.width
            height: root.height
            visible: parent.visible
        }
    }
    Image{
        id: sol10
//         Component.onCompleted:{root.imagenes[10] = sol10}
        width: root.width; height: root.height
        //cache: false
        fillMode: Image.PreserveAspectFit
        source: ""
        Behavior on opacity{ 
                NumberAnimation { duration: 700;easing.type:Easing.InExpo}
        }
        onOpacityChanged:{visible = opacity == 0?false:true}
        PlasmaCore.ToolTipArea {
            mainText: "False color  solar photospheric Intensitygram"
            width: root.width
            height: root.height
            visible: parent.visible
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
