Class {
	#name : #MiPackageBlueprintVisualization,
	#superclass : #MiAbstractVisualization,
	#instVars : [
		'classes',
		'selected',
		'references'
	],
	#category : #'Perso-Visualization-PackageBlueprint'
}

{ #category : #highlighting }
MiPackageBlueprintVisualization >> boxCompositeFor: aClass [

	| label box |
	box := self newBox.
	label := self newLabel: aClass name.
	RSLocation new
		above;
		move: box on: label.
	^ RSComposite new
		  shapes: { 
				  label.
				  box };
		  model: aClass;
		  @ RSDraggable;
		  addInteraction:
			  (MiSelection on: [ :entity | self selected: entity ]);
		  yourself
]

{ #category : #highlighting }
MiPackageBlueprintVisualization >> connectBoxes: boxes inCanvas: canvas [

	self canvas addAll: boxes.
	RSEdgeBuilder line
		canvas: canvas;
		shapes: boxes;
		withVerticalAttachPoint;
		connectToAll: [ :a | 
			(a usesFamixTrait: TEntityMetaLevelDependency)
				ifTrue: [ a children ]
				ifFalse: [ {  } ] ].
	RSTreeLayout on: boxes
]

{ #category : #highlighting }
MiPackageBlueprintVisualization >> highlightShapes [

	"Override to react to Midas highlight action"
]

{ #category : #highlighting }
MiPackageBlueprintVisualization >> initialize [

	super initialize.
	references := OrderedCollection new
]

{ #category : #highlighting }
MiPackageBlueprintVisualization >> newBox [

	^ RSBox new
		  size: 100;
		  color: self theme selectionColor;
		  yourself
]

{ #category : #highlighting }
MiPackageBlueprintVisualization >> newLabel: name [

	^ RSLabel new
		  text: name;
		  color: self theme textColor;
		  yourself
]

{ #category : #highlighting }
MiPackageBlueprintVisualization >> run [

	super run.
	self
		connectBoxes:
		(classes collect: [ :cls | self boxCompositeFor: cls ])
		inCanvas: self canvas.
	self canvas zoomToFit
]

{ #category : #highlighting }
MiPackageBlueprintVisualization >> selected [

	^ selected
]

{ #category : #highlighting }
MiPackageBlueprintVisualization >> selected: anObject [

	selected := anObject
]
