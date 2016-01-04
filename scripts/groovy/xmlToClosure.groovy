#!/usr/bin/env groovy

import javax.xml.parsers.DocumentBuilderFactory
import org.codehaus.groovy.tools.xml.DomToGroovy

/**
 * Generates a groovy closure from a given XML file
 */

def xmlFile = null

try {
	xmlFile = new File(args[0])
	if(!xmlFile.exists()){
		throw new Exception('FILE NOT FOUND')
	}
} catch(Exception e) {
	throw new RuntimeException('Argument must be a file', e)
}

if (xmlFile) {
	try {
		def xml = xmlFile.text

		def builder     = DocumentBuilderFactory.newInstance().newDocumentBuilder()
		def inputStream = new ByteArrayInputStream(xml.bytes)
		def document    = builder.parse(inputStream)
		def output      = new StringWriter()
		def converter   = new DomToGroovy(new PrintWriter(output))

		converter.print(document)
		println output.toString().replaceAll("  ", "    ")
	} catch(Exception e){
		throw new RuntimeException('Error generating closure from XML, e')
	}
}
