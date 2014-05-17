<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>T5-Repositório de Filmes (XSL)</title>
				<style type="text/css">
					<!--formatação css para os elementos da pagina -->
					body{text-align:center}
					#filmes{width:500px; background-color:#BEBEBE;}
					#menu{font-family:arial; font-size:32px; color:#880000; font-weight:bold;}
					p{margin:5px 10px 0px 10px; font-size:12px; font-family:times new roman;}
					h4{font-size:16px; color:#006400; font-family:verdana;}
					h5{font-size:12px; color:#8B1A1A; font-family:times new roman;}
					a.link1{font-family:verdana; font-size:13px; text-decoration:none; color:#003388;}
					a.link2{text-decoration:none; font-weight:bold; font-size:20px; color:#FFB90F; font-family:verdana;}
					a.link3{font-size:12px; color:#00008B}
					a:hover{background-color:#003388; color:#ffffff;}
				</style>
			</head>
			<body>
				<!-- cria o div que contem os restantes elementos -->
				<div id="filmes">
				<!--cria o titulo da pagina e a hiperligação que leva dos outros titulos até este -->
					<a id="menu" name="menu">Repositório de Filmes</a><br />
					<!--Para cada filme... -->
					<xsl:for-each select="filmes/filme">
						<!--mostra o titulo de forma a fazer um menu cujas hiperligações levam á parte do filme -->
						<xsl:element name="a">
							<xsl:attribute name="class">
								<xsl:value-of select='"link1"' />
							</xsl:attribute>
							<xsl:attribute name="href">
								<xsl:value-of select='concat("#", titulo)' />
							</xsl:attribute>
							<xsl:value-of select="titulo" />
						</xsl:element>
						<br/>
					</xsl:for-each>
					<!--Para cada filme... -->
					<xsl:for-each select="filmes/filme">
						<hr />
						<!--Cria um titulo com uma hiperligação para o titulo inicial -->
						<xsl:element name="a">
							<xsl:attribute name="class">
								<xsl:value-of select='"link2"' />
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="titulo" />
							</xsl:attribute>
							<xsl:attribute name="href">
								<xsl:value-of select='"#menu"' />
							</xsl:attribute>
							<xsl:value-of select="titulo" />
						</xsl:element>
						<br />
						<!--Cria uma imagem -->
						<xsl:element name="img">
							<xsl:attribute name="src">
								<xsl:value-of select="concat('imagens/', capa/@imagem)"/>
							</xsl:attribute>
						</xsl:element>
						<!--Cria um conjunto de informação -->
						<h4><xsl:value-of select='concat("Director: ", director)' /></h4>
						<h4><xsl:value-of select='concat("Escritor: ", escritor)' /></h4>
						<h5>
						Generos: |
						<xsl:for-each select="conteudo/genero">
							<xsl:value-of select="." />
							|
						</xsl:for-each>
						</h5>
						<h5><xsl:value-of select="texto" /></h5>
						<p>Elenco:</p>
						<xsl:for-each select="elenco/actor">
							<p><xsl:value-of select='concat(., " a interpretar ", @personagem)' /></p>
						</xsl:for-each>
						<br />
						<!--Cria hiperligações para paginas web -->
						<xsl:element name="a">
							<xsl:attribute name="class">
								<xsl:value-of select='"link3"' />
							</xsl:attribute>
							<xsl:attribute name="target">
								_blank
							</xsl:attribute>
							<xsl:attribute name="href">
								<xsl:value-of select='web/@imdb' />
							</xsl:attribute>
							IMDB
						</xsl:element>
						<br />
						<xsl:element name="a">
							<xsl:attribute name="class">
								<xsl:value-of select='"link3"' />
							</xsl:attribute>
							<xsl:attribute name="target">
								_blank
							</xsl:attribute>
							<xsl:attribute name="href">
								<xsl:value-of select='web/@paginafilme' />
							</xsl:attribute>
							Site Oficial
						</xsl:element>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>