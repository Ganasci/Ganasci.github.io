function transformar(fxml, fxsl){
	var oax_xml, oax_xsl;
	oax_xml=new ActiveXObject("Microsoft.XMLDOM");
	oax_xsl=new ActiveXObject("Microsoft.XMLDOM");
	oax_xml.async=false; oax_xsl.async=false;
	oax_xml.load(fxml);
	oax_xsl.load(fxsl);
	document.write(oax_xml.transformNode(oax_xsl));	
}