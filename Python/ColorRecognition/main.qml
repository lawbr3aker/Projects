import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.14

import "Templates/Dialogs" as Templates_Fourms
import "Core/Constants/Effects" as Constants_Effects

import Core 1.0

ApplicationWindow {
         id : root
      flags : Qt.Dialog
      width : 800
     height : 500
    visible : true

    DataHandler {
        id: dataHandler
    }

    Constants_Effects.Slider {
        id : homeSlider
        Templates_Fourms.Home {
             width : parent.width
            height : parent.height
            
            function colorRecognitionClicked() {
                           homeSlider.moveLeft()
                colorReportHomeSlider.moveLeft()
            }
        }
    }

    Constants_Effects.Slider {
        id : colorReportHomeSlider
         x : width
        Templates_Fourms.ColorRecognitionHome {
             width : parent.width
            height : parent.height

            function onClick(what) {
                switch (what) {
                    case "heavy" :
                        colorReportHomeSlider.moveLeft()
                           heavyCarFormSlider.moveLeft()
                        break
                    case "simple" :
                        colorReportHomeSlider.moveLeft()
                          simpleCarFormSlider.moveLeft()
                        break
                    case "setting" :
                        colorReportHomeSlider.moveLeft()
                                settingSlider.moveLeft()
                }
            }
        }
    }

    Constants_Effects.Slider {
        id : heavyCarFormSlider
         x : width
        Templates_Fourms.HeavyColorRecognition {
                      width : parent.width
                     height : parent.height
                dataHandler : dataHandler

            onBack: {
                colorReportHomeSlider.moveRight()
                   heavyCarFormSlider.moveRight()
            }
        }
    }

    Constants_Effects.Slider {
        id : simpleCarFormSlider
         x : width
        Templates_Fourms.SimpleColorRecognition {
                      width : parent.width
                     height : parent.height
                dataHandler : dataHandler

            onBack: {
                colorReportHomeSlider.moveRight()
                  simpleCarFormSlider.moveRight()
            }
        }
    }
    Constants_Effects.Slider {
        id : settingSlider
         x : width
        Templates_Fourms.Setting {
                     id : setting
                  width : parent.width
                 height : parent.height
            dataHandler : dataHandler

            onBack: {
                        settingSlider.moveRight()
                colorReportHomeSlider.moveRight()
            }
        }
    }
}
