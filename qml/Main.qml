/*
 * Copyright (C) 2022 Piotr Lange
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * Base Converter is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.3
import "./"

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'baseconverter.piotrzpl'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    property string app_version: "0.0.1"

    
    property var settings: Settings {
        property string primaryColor: "#0169c9"
        property string theme: "Ambiance"
        onThemeChanged: Theme.name = "Ubuntu.Components.Themes." + settings.theme
    }

    Component {
        id: aboutPage
        About {}
    }

//	Component {
//		id: lcmPage
//		LCM {}
//	}

//	Component {
//		id: gcfPage
//		GCF {}
//	}
    
    PageStack{
        id: pageStack

        Component.onCompleted: push(mainPage)

	    Page {
	        id: mainPage
	        visible: false
	        anchors.fill: parent
	
	        header: PageHeader {
	            id: header
	            title: i18n.tr('UltraMath')
	            trailingActionBar.actions: [
	                    Action {
	                        text: i18n.tr("Theme")
	                        iconName: (root.settings.theme == "Ambiance") ? "torch-on" : "torch-off"
	                        onTriggered: root.settings.theme = (root.settings.theme == "Ambiance") ? "SuruDark" : "Ambiance"
	                    },
	                    Action {
	                        text: i18n.tr("About")
	                        iconName: "help"
	                        onTriggered: pageStack.push(aboutPage)
	                    }
	                ]
	        }

			Rectangle {
				id: mainRec
				height: units.gu(16)
				color: backgroundColor
				Grid {
					id: mainGrid
					anchors { 
						top: header.bottom
						left: parent.left
						right: parent.right
						bottom: parent.bottom
					}
					columns: 2
					rows: 2
					spacing: 3

					Rectangle {
						//id: tryrec
						color: backgroundColor
						//height: parent.height / 2
						height: units.gu(8)
						width: parent.width / 2
						
						Label {
							//id: isPrimeText
							text: i18n.tr("Number")
							font.pixelSize: units.gu(3)
							font.bold: true
							anchors.centerIn: parent
						
						}
					
					}

					Rectangle {
						//id: tryrec
						color: backgroundColor
						//height: parent.height / 2
						height: units.gu(8)
						width: parent.width / 2
						
						Label {
							//id: isPrimeText
							text: i18n.tr("Base")
							font.pixelSize: units.gu(3)
							font.bold: true
							anchors.centerIn: parent
						
						}
					
					}

					TextField {
						id: textField1
						inputMethodHints: Qt.ImhDigitsOnly
						text: ""
						
						property bool hasError: false
						font.italic: hasError
						//anchors {
						//	topMargin: units.gu(1);
						//	top: header.bottom
						//	left: parent.left
						//	leftMargin: units.gu(1);
						//	right: parent.right
						//	rightMargin: units.gu(1);
						//}
				
						height: units.gu(8)
						font.pixelSize: units.gu(4)
					}

					TextField {
						id: textField2
						inputMethodHints: Qt.ImhDigitsOnly
						text: "10"
						
						property bool hasError: false
						font.italic: hasError
						//anchors {
						//	topMargin: units.gu(1);
						//	top: header.bottom
						//	left: parent.left
						//	leftMargin: units.gu(1);
						//	right: parent.right
						//	rightMargin: units.gu(1);
						//}
				
						height: units.gu(8)
						font.pixelSize: units.gu(4)
					}
				}
				anchors {
					topMargin: units.gu(1);
					top: header.bottom
					left: parent.left
					//leftMargin: units.gu(0.2);
					right: parent.right
					//rightMargin: units.gu(0.2);
					//bottom: mainRec.top
				}
			}

			Rectangle {
				id: convrec
				color: backgroundColor
				//height: parent.height / 2
				height: units.gu(8)
				//width: parent.width / 2
				//anchors.centerIn: parent
				
				Label {
					//id: isPrimeText
					text: i18n.tr("Convert to:")
					font.pixelSize: units.gu(3)
					font.bold: true
					anchors.centerIn: parent
				
				}

				anchors {
					topMargin: units.gu(1);
					top: mainRec.bottom
					left: parent.left
					leftMargin: units.gu(1);
					right: parent.right
					rightMargin: units.gu(1);
					//bottom: mainRec.top
				}
			}

			Rectangle {
				id: bottomRec
				height: units.gu(16)
				color: backgroundColor
				Grid {
					id: bottomGrid
					anchors { 
						top: header.bottom
						left: parent.left
						right: parent.right
						bottom: parent.bottom
					}
					columns: 2
					rows: 2
					spacing: 3

					Rectangle {
						//id: tryrec
						color: backgroundColor
						//height: parent.height / 2
						height: units.gu(8)
						width: parent.width / 2
						
						Label {
							//id: isPrimeText
							text: i18n.tr("Number")
							font.pixelSize: units.gu(3)
							font.bold: true
							anchors.centerIn: parent
						
						}
					
					}

					Rectangle {
						//id: tryrec
						color: backgroundColor
						//height: parent.height / 2
						height: units.gu(8)
						width: parent.width / 2
						
						Label {
							//id: isPrimeText
							text: i18n.tr("Base")
							font.pixelSize: units.gu(3)
							font.bold: true
							anchors.centerIn: parent
						
						}
					
					}

					Rectangle {
						//id: tryrec
						color: backgroundColor
						//height: parent.height / 2
						height: units.gu(8)
						width: parent.width / 2
						
						Label {
							//id: isPrimeText
							text: i18n.tr("X")
							font.pixelSize: units.gu(3)
							font.bold: true
							anchors.centerIn: parent
						
						}
					
					}

					TextField {
						id: textField3
						inputMethodHints: Qt.ImhDigitsOnly
						text: "10"
						
						property bool hasError: false
						font.italic: hasError
						//anchors {
						//	topMargin: units.gu(1);
						//	top: header.bottom
						//	left: parent.left
						//	leftMargin: units.gu(1);
						//	right: parent.right
						//	rightMargin: units.gu(1);
						//}
				
						height: units.gu(8)
						font.pixelSize: units.gu(4)
					}
				}
				anchors {
					topMargin: units.gu(1);
					top: convrec.bottom
					left: parent.left
					//leftMargin: units.gu(1);
					right: parent.right
					//rightMargin: units.gu(1);
					//bottom: mainRec.top
				}
			}
	
	        //height: units.gu(8)
	        //font.pixelSize: units.gu(4)   
	        Python {
	            id: python
	
	            Component.onCompleted: {
	                addImportPath(Qt.resolvedUrl('../src/'));
	            importModule_sync("example")
	            }
	
	            onError: {
	                console.log('python error: ' + traceback);
	            }
	        }
	    }
	}
}