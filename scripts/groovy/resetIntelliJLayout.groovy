#!/usr/bin/env groovy

import groovy.xml.StreamingMarkupBuilder
import groovy.xml.XmlUtil

/**
 * Resets IntelliJ to the way I like it!
 */
String pathToWorkspaceXml = '.idea/workspace.xml'
File workspaceXmlFile = new File(pathToWorkspaceXml)
if (workspaceXmlFile.exists()) {
    def workspaceXmlGpathResult = new XmlSlurper().parseText(workspaceXmlFile.text)
    def toolWindowManagerNode = workspaceXmlGpathResult.component.find { it.@name == 'ToolWindowManager' }
    if (toolWindowManagerNode.size() > 0) {
        toolWindowManagerNode.layout.replaceNode {
            layout {
                window_info(id: "Changes", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "-1", side_tool: "false", content_ui: "tabs")
                window_info(id: "Persistence", active: "false", anchor: "left", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "0", side_tool: "true", content_ui: "tabs")
                window_info(id: "JetGradle", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "2", side_tool: "false", content_ui: "tabs")
                window_info(id: "Palette", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "3", side_tool: "false", content_ui: "tabs")
                window_info(id: "Database", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "4", side_tool: "false", content_ui: "tabs")
                window_info(id: "Ant Build", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.25", sideWeight: "0.5", order: "9", side_tool: "false", content_ui: "tabs")
                window_info(id: "Debug", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.4", sideWeight: "0.5", order: "3", side_tool: "false", content_ui: "tabs")
                window_info(id: "IDEtalk Messages", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "-1", side_tool: "false", content_ui: "tabs")
                window_info(id: "Event Log", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "-1", side_tool: "true", content_ui: "tabs")
                window_info(id: "Favorites", active: "false", anchor: "left", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "1", side_tool: "true", content_ui: "tabs")
                window_info(id: "Console", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "-1", side_tool: "false", content_ui: "tabs")
                window_info(id: "Grails View", active: "false", anchor: "left", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "2", side_tool: "false", content_ui: "tabs")
                window_info(id: "IDEtalk", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "5", side_tool: "false", content_ui: "tabs")
                window_info(id: "Version Control", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "-1", side_tool: "false", content_ui: "tabs")
                window_info(id: "CDI", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "6", side_tool: "false", content_ui: "tabs")
                window_info(id: "Regex Tester", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "-1", side_tool: "false", content_ui: "tabs")
                window_info(id: "Web", active: "false", anchor: "left", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "3", side_tool: "true", content_ui: "tabs")
                window_info(id: "TODO", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "6", side_tool: "false", content_ui: "tabs")
                window_info(id: "Structure", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.25", sideWeight: "0.5", order: "1", side_tool: "false", content_ui: "tabs")
                window_info(id: "Maven Projects", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "7", side_tool: "false", content_ui: "tabs")
                window_info(id: "Commander", active: "false", anchor: "right", auto_hide: "false", internal_type: "SLIDING", type: "SLIDING", visible: "false", weight: "0.4", sideWeight: "0.5", order: "8", side_tool: "false", content_ui: "tabs")
                window_info(id: "Application Servers", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "-1", side_tool: "false", content_ui: "tabs")
                window_info(id: "Project", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "true", weight: "0.2470651", sideWeight: "0.5", order: "0", side_tool: "false", content_ui: "combo")
                window_info(id: "Run", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "2", side_tool: "false", content_ui: "tabs")
                window_info(id: "Cvs", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.25", sideWeight: "0.5", order: "4", side_tool: "false", content_ui: "tabs")
                window_info(id: "Message", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "0", side_tool: "false", content_ui: "tabs")
                window_info(id: "Find", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.33", sideWeight: "0.5", order: "1", side_tool: "false", content_ui: "tabs")
                window_info(id: "Inspection", active: "false", anchor: "bottom", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.4", sideWeight: "0.5", order: "5", side_tool: "false", content_ui: "tabs")
                window_info(id: "Hierarchy", active: "false", anchor: "right", auto_hide: "false", internal_type: "DOCKED", type: "DOCKED", visible: "false", weight: "0.25", sideWeight: "0.5", order: "10", side_tool: "false", content_ui: "combo")
            }
        }
        workspaceXmlFile.write(XmlUtil.serialize(new StreamingMarkupBuilder().bind { mkp.yield workspaceXmlGpathResult }))
    } else {
        println 'Could not find ToolWindowManager node.'
    }
} else {
    println "Could not find ${pathToWorkspaceXml}.  Make sure you are in the project root."
}


def pathToImlFile = 'web.iml'
def imlFile = new File(pathToImlFile)
if (imlFile.exists()) {
    def imlFileGpathResult = new XmlSlurper().parseText(imlFile.text)
    def newModuleRootManagerComponentNode = imlFileGpathResult.component.find { it.@name == 'NewModuleRootManager' }
    if (newModuleRootManagerComponentNode.size() > 0) {
        newModuleRootManagerComponentNode.content.replaceNode {
            content(url:'file://$MODULE_DIR$') {
                sourceFolder(isTestSource:'true', url:'file://$MODULE_DIR$/test/unit')
                sourceFolder(isTestSource:'true', url:'file://$MODULE_DIR$/test/integration')
                sourceFolder(isTestSource:'true', url:'file://$MODULE_DIR$/test/functional')
                sourceFolder(isTestSource:'false', url:'file://$MODULE_DIR$/src/java')
                sourceFolder(isTestSource:'false', url:'file://$MODULE_DIR$/grails-app/utils')
                sourceFolder(isTestSource:'false', url:'file://$MODULE_DIR$/src/groovy')
                sourceFolder(isTestSource:'false', url:'file://$MODULE_DIR$/grails-app/i18n')
                sourceFolder(isTestSource:'false', url:'file://$MODULE_DIR$/grails-app/controllers')
                sourceFolder(isTestSource:'false', url:'file://$MODULE_DIR$/grails-app/domain')
                sourceFolder(isTestSource:'false', url:'file://$MODULE_DIR$/grails-app/services')
                sourceFolder(isTestSource:'false', url:'file://$MODULE_DIR$/grails-app/taglib')
                sourceFolder(isTestSource:'false', url:'file://$MODULE_DIR$/grails-app/assets')
                excludeFolder(url:'file://$MODULE_DIR$/.idea')
                excludeFolder(url:'file://$MODULE_DIR$/.jruby-container')
                excludeFolder(url:'file://$MODULE_DIR$/.sass-cache')
                excludeFolder(url:'file://$MODULE_DIR$/.sass-work')
                excludeFolder(url:'file://$MODULE_DIR$/target')
            }
        }
        imlFile.write(XmlUtil.serialize(new StreamingMarkupBuilder().bind { mkp.yield imlFileGpathResult }))
    }
}
