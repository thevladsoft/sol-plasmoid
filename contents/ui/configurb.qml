import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtQuick.Layouts 1.1 as QtLayouts
import QtQuick.Controls 1.0 as QtControls
import QtQuick.Dialogs 1.0

Item {
    id: rootconf
    
    property alias cfg_cleaner: cleanercheck.checked
    property alias cfg_cleanersize: cleanerspin.value
    property alias cfg_background: showbackground.checked
    
    
    QtLayouts.ColumnLayout {
        spacing: units.smallSpacing * 4
                
        QtLayouts.RowLayout{
            //Item{width: 20}        
//             Column{
                QtControls.CheckBox {
                        id: cleanercheck
                        //QtLayouts.Layout.fillWidth: true
                        text: "Erase disk cache if larger than:  "
                }
                QtControls.SpinBox {
                        id: cleanerspin
                        minimumValue: 5
                        enabled: cleanercheck.checked
                }
                QtControls.Label {
                        QtLayouts.Layout.fillWidth: true
                        verticalAlignment: Text.AlignBottom
                        text: "mb"
                        enabled: cleanercheck.checked
                }
        }
        
        QtControls.CheckBox {
            id: showbackground
            //QtLayouts.Layout.fillWidth: true
            text: "Show app background"
        }
                    
    }
}

