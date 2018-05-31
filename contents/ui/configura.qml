import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.plasmoid 2.0
Item {
	id: page
// 	property alias cfg_tamano: slide.value
    property alias cfg_resolution: page.resolution
    property alias cfg_source: page.source
	property var resolution
	property var botones: []
	property var source
	
// 	onResolutionsChanged:{print("HEY")}
	
	ColumnLayout {
// 		    width: 800
// 		    anchors.fill: parent
// 		    height: 400
        Label{
			text: "Resolution"
// 			anchors.fill: parent
		}
        RowLayout{
			id: resolutions
// 			anchors.fill: parent
// 			anchor.top: 
            ExclusiveGroup { id: resradiobuttons }
			RadioButton{
				id: thumbnail
				text: "Low  (128x128)"
				exclusiveGroup: resradiobuttons
				onCheckedChanged:{page.resolution = thumbnail.checked+middle.checked*2+high.checked*3}
				Component.onCompleted:{ checked= plasmoid.configuration.resolution == 1}
			}
			RadioButton{
				id: middle
				text: "Middle (512x512)"
				exclusiveGroup: resradiobuttons
				onCheckedChanged:{page.resolution = thumbnail.checked+middle.checked*2+high.checked*3}
				Component.onCompleted:{ checked= plasmoid.configuration.resolution == 2}
// 				visible: false
			}
			RadioButton{
				id: high
				text: "High (1024x1024)"
				exclusiveGroup: resradiobuttons
				onCheckedChanged:{page.resolution = thumbnail.checked+middle.checked*2+high.checked*3}
				Component.onCompleted:{ checked= plasmoid.configuration.resolution == 3}
			}
		}
		Label{
			text: "Source"
// 			anchors.fill: parent
		}
		/************/
		ExclusiveGroup { id: sourceradiobuttons }
		RowLayout{
			
			RadioButton{
				id: boton0
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 0
					page.botones[0] = boton0
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_aia_94_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color image of the Sun in Fe XVIII 94 Å "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton0.checked= true
			}
		}
		/********************/
		RowLayout{
			
			RadioButton{
				id: boton1
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 1
					page.botones[1] = boton1
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_aia_131_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color image of the Sun in Fe XX 131 Å "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton1.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton2
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 2
					page.botones[2] = boton2
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_aia_171_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color image of the Sun in Fe IX, X 171 Å "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton2.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton3
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 3
					page.botones[3] = boton3
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_aia_193_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color image of the Sun in Fe XII 193 Å "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton3.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton4
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 4
					page.botones[4] = boton4
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_aia_211_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color image of the Sun in Fe XIV 211 Å "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton4.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton5
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 5
					page.botones[5] = boton5
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_aia_304_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color image of the Sun in He II 304 Å Å "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton5.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton6
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 6
					page.botones[6] = boton6
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_aia_335_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color image of the Sun in Fe XVI 335 Å "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton6.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton7
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 7
					page.botones[7] = boton7
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_aia_1600_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color image of the Sun in C IV and continuum around 1600 Å "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton7.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton8
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 8
					page.botones[8] = boton8
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_aia_1700_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color image of the Sun in continuum around 1700 Å "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton8.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton9
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 9
					page.botones[9] = boton9
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_hmi_mgram_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color  solar photospheric magnetogram "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton9.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton10
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 10
					page.botones[10] = boton10
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			Image{
				width: 40
				height: 40
 				source: "thumbnails/latest_hmi_igram_tn.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "False color  solar photospheric Intensitygram "
			}
			MouseArea {anchors.fill: parent
				onClicked: boton10.checked= true
			}
		}
		RowLayout{
			
			RadioButton{
				id: boton11
				Component.onCompleted:{
					checked= plasmoid.configuration.source == 11
					page.botones[11] = boton11
				}
                onCheckedChanged:{
					var j = 0
					for(var i = 0;i<12;i++){
						j +=page.botones[i].checked*i
					}page.source = j
				}
				exclusiveGroup: sourceradiobuttons
			}
			AnimatedImage{
				width: 40
				height: 40
 				source: "thumbnails/image.gif"
			}
			Label{
				width:scroll.width-60
				height: 40
				text: "All (show each image for 1 minute)"
			}
			MouseArea {anchors.fill: parent
				onClicked: boton11.checked= true
			}
		}
				

	}
		
// 	}

}
