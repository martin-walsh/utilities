#!/usr/bin/env groovy

/*
SCRIPT TO FIGURE OUT WHICH ENGINE AN APP IS ON, AND ITS VERSION
*/
def appName = null
if( args.size() == 0 ){
    appName = System.getProperty('user.dir').split('/')[-1]
    println "Querying current project: '$appName' as no argument specified"
} else {
    appName = args[0]
}
String homeDir = System.getProperty('user.home')

List<Map> locations = [
    [box: 'TPI', dir: new File("$homeDir/code/config-tpi")],
    [box: 'SYS', dir: new File("$homeDir/code/config-sys")],
    [box: 'UAT', dir: new File("$homeDir/code/config-uat")],
    [box: 'CMBETA', dir: new File("$homeDir/code/config-cmbeta")],
    [box: 'STG', dir: new File("$homeDir/code/config-stg")],
    [box: 'AU', dir: new File("$homeDir/code/config-au")],
    [box: 'UK', dir: new File("$homeDir/code/config-uk")]
]

println()

locations.each { Map config ->
    def grailsYamlText = new File(config.dir, 'conf/apps/grails.yaml').text.readLines()

    def appLines = grailsYamlText.findAll { it.contains(appName) }
    appLines.each { appLine ->
        println "*** ${config.box} ***"
        println "App Version: $appLine"

        def actualAppName = appLine.split(':')[0].trim()
        def hostsDir = new File(config.dir, 'conf/hosts')
        hostsDir.listFiles().each { File appBox ->
            appBox.listFiles().each { File engineYaml ->
                def text = engineYaml.text.readLines()
                appLine = text.find { it.trim().endsWith(actualAppName) }
                if (appLine) {
                    println "Location: ${appBox.name} ${engineYaml.name.replace('.yaml', '')}"
                }
            }
        }
        println()
    }
}
