Class {
	#name : #MiSystemComplexityVisualization,
	#superclass : #MiAbstractVisualization,
	#instVars : [
		'entities',
		'selected',
		'width',
		'height',
		'isRunned'
	],
	#category : #'Perso-Visualization-RImplementation'
}

{ #category : #highlighting }
MiSystemComplexityVisualization >> boxFor: aClass [

	^ RSBox new
		  model: aClass;
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

{ #category : #accessing }
MiSystemComplexityVisualization >> color [

	^ color  ifNil: [ color :=  #numberOfLinesOfCode ]
]

{ #category : #accessing }
MiSystemComplexityVisualization >> color: anObject [

	color := anObject
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

{ #category : #accessing }
MiSystemComplexityVisualization >> height [

	^ height ifNil: [ height := #numberOfMethods ]
]

{ #category : #accessing }
MiSystemComplexityVisualization >> height: anObject [

	height := anObject
]

{ #category : #highlighting }
MiSystemComplexityVisualization >> highlightShapes [
self flag: #TODO. "implementer la possibilité de highligter une classe propagé et déjà présente dans le Browser" 
	
]

{ #category : #accessing }
MiSystemComplexityVisualization >> isRunned [

	^ isRunned ifNil: [ isRunned := false ]
]

{ #category : #accessing }
MiSystemComplexityVisualization >> isRunned: aBoolean [

	isRunned := aBoolean
]

{ #category : #highlighting }
MiSystemComplexityVisualization >> normalizeColor [

	RSNormalizer color
		from: Color white;
		to: Color black;
		shapes: self canvas nodes;
		normalize: self color
]

{ #category : #highlighting }
MiSystemComplexityVisualization >> normalizeHeight [

	RSNormalizer height
		scale: (NSScale linear range: { 5. 100 });
		shapes: self canvas nodes;
		normalize: self height
]

{ #category : #highlighting }
MiSystemComplexityVisualization >> normalizeWidth [

	RSNormalizer width
		scale: (NSScale linear range: { 5. 100 });
		shapes: self canvas nodes;
		normalize: self width
]

{ #category : #running }
MiSystemComplexityVisualization >> run [
"self halt."
	super run.

	self isRunned: true.

	self canvas addAll:
		(entities collect: [ :aClass | self boxFor: aClass ]).

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

{ #category : #accessing }
MiSystemComplexityVisualization >> width [

	^ width ifNil: [ width := #numberOfAttributes ]
]

{ #category : #accessing }
MiSystemComplexityVisualization >> width: anObject [

	width := anObject
]
