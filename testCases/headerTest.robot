*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome

${homeURL}  xpath://header/div[1]/div[1]/div[1]/a[1]/img[1]
${ubicellURL}   xpath://*[@id="block-mainnavigation"]/ul/li[1]/a
${ubimetroURL}  xpath://*[@id="block-mainnavigation"]/ul/li[2]/a

#advanced light control
${alcURL}  xpath://*[@id="block-mainnavigation"]/ul/li[3]/ul/li[1]/a
#public wifi & small cell
${pwscURL}  xpath://*[@id="block-mainnavigation"]/ul/li[3]/ul/li[2]/a
#video/audio edge processing
${vaepURL}  xpath://*[@id="block-mainnavigation"]/ul/li[3]/ul/li[3]/a
#sensor applications
${sensorAppURL}     xpath://*[@id="block-mainnavigation"]/ul/li[3]/ul/li[4]/a

${careersURL}   xpath://*[@id="block-mainnavigation"]/ul/li[4]/a
${newsURL}  xpath://*[@id="block-mainnavigation"]/ul/li[5]/a

#US & Canada
${UsCaURL}  xpath://*[@id="block-mainnavigation"]/ul/li[6]/ul/li[1]/a
#Latin America
${LaURL}    xpath://*[@id="block-mainnavigation"]/ul/li[6]/ul/li[2]/a

${sleepTime}     1

*** Test Cases ***
homePageTest
    open browser    https://www.ubicquia.com/    ${browser}
    title should be     Welcome to Ubicquia | ubicquia

    #testing header
    goToUbicell
    goToHomePage
    goToUbimetro
    goToHomePage
    #missing applications links
    goToALC
    goToHomePage
    goToPWSC
    goToHomePage
    goToVAEP
    goToHomePage
    goToSensorsApp
    goToHomePage
    goToCareers
    goToHomePage
    goToNews
    goToHomePage
    goToUC
    goToHomePage
    goToLA
    goToHomePage

    hamburgerMenu
    #make sure its visible
    close browser




*** Keywords ***
goToHomePage
    click image  ${homeURL}
    title should be     Welcome to Ubicquia | ubicquia
    #wait x seconds until proceeding to next step
    sleep   ${sleepTime}

goToUbicell
    click link  ${ubicellURL}
    title should be     Ubicell | ubicquia
    sleep   ${sleepTime}

goToUbimetro
    click link  ${ubimetroURL}
    title should be     Ubimetro | ubicquia
    sleep   ${sleepTime}

#applcations/advanced-light-controls
goToALC
    mouse over  xpath://header/div[1]/div[1]/nav[1]/ul[1]/li[3]/span[1]
    click link  ${alcURL}
    title should be     Advanced Light Controls | ubicquia
    sleep   ${sleepTime}

#applications/public-wifi-small-cell
goToPWSC
    mouse over  xpath://header/div[1]/div[1]/nav[1]/ul[1]/li[3]/span[1]
    click link  ${pwscURL}
    title should be     Public WiFi & Small Cell | ubicquia
    sleep   ${sleepTime}

#applications/videoaudio-edge-processing
goToVAEP
    mouse over  xpath://header/div[1]/div[1]/nav[1]/ul[1]/li[3]/span[1]
    click link  ${vaepURL}
    title should be     Video/Audio Edge Processing | ubicquia
    sleep   ${sleepTime}

#applications/sensors-applications
goToSensorsApp
    mouse over  xpath://header/div[1]/div[1]/nav[1]/ul[1]/li[3]/span[1]
    click link  ${sensorAppURL}
    title should be     Sensors & Applications | ubicquia
    sleep   ${sleepTime}

goToCareers
    click link  ${careersURL}
    title should be     Careers | ubicquia
    sleep   ${sleepTime}

goToNews
    click link  ${newsURL}
    title should be     Newsroom | ubicquia
    sleep   ${sleepTime}

#where to buy - US and Canada
goToUC
    mouse over  xpath://span[contains(text(),'Where to Buy')]
    click link  ${UsCaURL}
    title should be     Where to buy US and Canada | ubicquia
    sleep   ${sleepTime}

#where to buy - Latin America
goToLA
    mouse over  xpath://span[contains(text(),'Where to Buy')]
    click link  ${LaURL}
    title should be     Where to buy Latin America | ubicquia
    sleep   ${sleepTime}

#Hamburger menu
hamburgerMenu
    click element  xpath://header/div[1]/div[1]/div[2]/i[1]
    sleep   5
    click element  xpath://header/div[1]/div[1]/div[2]/i[2]
    sleep   ${sleepTime}
