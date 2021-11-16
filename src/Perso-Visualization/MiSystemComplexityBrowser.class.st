Class {
	#name : #MiSystemComplexityBrowser,
	#superclass : #MiAbstractBrowser,
	#instVars : [
		'visualization'
	],
	#category : #'Perso-Visualization-RImplementation'
}

{ #category : #specs }
MiSystemComplexityBrowser class >> defaultSpec [

	^ super defaultSpec
		  add: #visualization;
		  yourself
]

{ #category : #specs }
MiSystemComplexityBrowser class >> open [

	<script>
	^ super open
]

{ #category : #specs }
MiSystemComplexityBrowser class >> title [

	^ 'SystemComplexityVisualisation'
]

{ #category : #testing }
MiSystemComplexityBrowser >> canReceiveEntity: anObject [

	^ (self needUpdate: anObject) and: [ 
		  anObject asMooseSpecializedGroup isKindOf: FamixTypeGroup ]
]

{ #category : #actions }
MiSystemComplexityBrowser >> followEntity: anEntity [

	visualization
		entities: anEntity asMooseSpecializedGroup;
		run
]

{ #category : #initialization }
MiSystemComplexityBrowser >> initializePresenters [

	super initializePresenters.
	visualization := self instantiate: MiSystemComplexityVisualization
]

{ #category : #initialization }
MiSystemComplexityBrowser >> miSelectedItem [ 
^	visualization selected ifNil: [ visualization entities  ]
]

{ #category : #initialization }
MiSystemComplexityBrowser >> needUpdate: anEntity [

	^ anEntity ~= visualization entities
]
