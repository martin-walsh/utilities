#!/usr/bin/env groovy

import java.util.regex.Matcher

def inFile = null
def outFile = null

inFile = new File(args[0])
outFile = new File(args[1])

List<String> inFileLines = inFile.readLines()
List<String> outFileLines = outFile.readLines()

Matcher matcher = null


//TODO: Change regex below to alter matching:
String lineRegex = /^(\S+):\s*(.+)\s*$/

Map apps  = [:]

//Collect Apps
outFileLines.each {
	matcher = (it =~ lineRegex)
	apps << [(matcher[0][1]):matcher[0][2]]
}


apps.each {name , version ->
	String matchingLine = inFileLines.find { it.startsWith("${name}:")
	if(matchingLine){
		apps << [(name): matchingLine.split(':')[1]]
	}
}

outFile.write('')
apps.each { k, v ->
	outFile << "$k: $v\n"
}
