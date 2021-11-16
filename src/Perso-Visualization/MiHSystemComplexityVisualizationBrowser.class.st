Class {
	#name : #MiHSystemComplexityVisualizationBrowser,
	#superclass : #MiAbstractBrowser,
	#instVars : [
		'diagram'
	],
	#category : #'Perso-Visualization-Implementation'
}

{ #category : #'instance creation' }
MiHSystemComplexityVisualizationBrowser class >> defaultSpec [

	^ super defaultSpec
		  add: #diagram;
		  yourself
]

{ #category : #'instance creation' }
MiHSystemComplexityVisualizationBrowser class >> open [

	<script>
	^super open
]

{ #category : #'instance creation' }
MiHSystemComplexityVisualizationBrowser class >> title [

	^ 'MiHSystemComplexityVisualization'
]

{ #category : #testing }
MiHSystemComplexityVisualizationBrowser >> canReceiveEntity: anObject [

	^ anObject isMooseObject and: anObject isStub not
]

{ #category : #actions }
MiHSystemComplexityVisualizationBrowser >> followEntity: anEntity [

"diagram
		entities:
			(anEntity allToScope: FamixTClass) asMooseSpecializedGroup;
		run"
	diagram
		entities: anEntity asMooseGroup;
		run

	
]

{ #category : #testing }
MiHSystemComplexityVisualizationBrowser >> initializePresenters [

	super initializePresenters.
	diagram := self instantiate: MiHSystemComplexityVisualization.
]
