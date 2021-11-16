Extension { #name : #HNode }

{ #category : #'*Perso-Visualization' }
HNode >> openWithCanvas: aCanvas [

	^ HSimpleVisualizationBuilder new
		  rootNode: self;
		container: aCanvas;
		  build.
]
