Class {
	#name : #MiSystemComplexityVisualization,
	#superclass : #MiAbstractVisualization,
	#instVars : [
		'entities',
		'selected'
	],
	#category : #'Perso-Visualization-RImplementation'
}

{ #category : #highlighting }
MiSystemComplexityVisualization >> boxFor: cls [

	^ RSBox new
		  model: cls;
		  borderColor: Color black;
		  @ RSDraggable;
		  @ RSPopup;
		addInteraction:
			  (MiSelection on: [ :entity | self selected: entity ]);
		  yourself
]

{ #category : #running }
MiSystemComplexityVisualization >> buildEgdes [

	RSEdgeBuilder line
		shapes: self canvas nodes;
		withVerticalAttachPoint;
		connectFromAll: #directSuperclasses.
	self canvas pushBackEdges
]

{ #category : #highlighting }
MiSystemComplexityVisualization >> connectBoxes [

	self buildEgdes.
	RSDominanceTreeLayout new
		on: self canvas nodes
		edges: self canvas edges
]

{ #category : #accessing }
MiSystemComplexityVisualization >> entities [
	^ entities 
]

{ #category : #accessing }
MiSystemComplexityVisualization >> entities: anObject [

	entities := anObject
]

{ #category : #highlighting }
MiSystemComplexityVisualization >> highlightShapes [
]

{ #category : #highlighting }
MiSystemComplexityVisualization >> normalizeColor [

	RSNormalizer color
		from: Color white;
		to: Color black;
		shapes: self canvas nodes;
		normalize: #numberOfLinesOfCode
]

{ #category : #highlighting }
MiSystemComplexityVisualization >> normalizeHeight [

	RSNormalizer height
		scale: (NSScale linear range: { 5. 100 });
		shapes: self canvas nodes;
		normalize: #numberOfMethods
]

{ #category : #highlighting }
MiSystemComplexityVisualization >> normalizeWidth [

	RSNormalizer width
		scale: (NSScale linear range: { 5. 100 });
		shapes:  self canvas nodes;
		normalize: #numberOfAttributes
]

{ #category : #running }
MiSystemComplexityVisualization >> run [

	super run.

	self canvas addAll: (entities collect: [ :cls | self boxFor: cls ]).

	self normalizeHeight.
	self normalizeWidth.
	self normalizeColor.

	self connectBoxes.
	self canvas zoomToFit
]

{ #category : #accessing }
MiSystemComplexityVisualization >> selected [

	^ selected
]

{ #category : #accessing }
MiSystemComplexityVisualization >> selected: anObject [

	selected := anObject
]
