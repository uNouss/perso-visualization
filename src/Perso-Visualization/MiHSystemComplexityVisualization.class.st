Class {
	#name : #MiHSystemComplexityVisualization,
	#superclass : #MiAbstractVisualization,
	#instVars : [
		'rootNode',
		'builder',
		'entities'
	],
	#category : #'Perso-Visualization-Implementation'
}

{ #category : #highlighting }
MiHSystemComplexityVisualization >> entities:  anObject [

	entities := anObject
]

{ #category : #highlighting }
MiHSystemComplexityVisualization >> highlightShapes [
]

{ #category : #highlighting }
MiHSystemComplexityVisualization >> run [

	super run.
	"self halt."
	builder := HSystemComplexityVisualizationBuilder new entities: entities.
	builder build.
	builder rootNode openWithCanvas: self canvas.
	self canvas zoomToFit
]
