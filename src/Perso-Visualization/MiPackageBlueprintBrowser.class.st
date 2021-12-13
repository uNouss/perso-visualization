Class {
	#name : #MiPackageBlueprintBrowser,
	#superclass : #MiAbstractBrowser,
	#instVars : [
		'visualization'
	],
	#category : #'Perso-Visualization-PackageBlueprint'
}

{ #category : #specs }
MiPackageBlueprintBrowser class >> defaultSpec [


	^ super defaultSpec
		  add: #visualization;
		  yourself
]

{ #category : #specs }
MiPackageBlueprintBrowser class >> open [

	<script>
	^ super open
]

{ #category : #specs }
MiPackageBlueprintBrowser class >> title [

	^ 'PackageBlueprintVisualisation'
]

{ #category : #testing }
MiPackageBlueprintBrowser >> canReceiveEntity: anEntity [
	^ (self needUpdate: anEntity) and: [ 
		  (anEntity asMooseSpecializedGroup isKindOf: FamixTypeGroup) ]
]

{ #category : #actions }
MiPackageBlueprintBrowser >> followEntity: anEntity [

	^ visualization entities: anEntity
]

{ #category : #actions }
MiPackageBlueprintBrowser >> initializePresenters [


	super initializePresenters.
	visualization := self instantiate: MiSystemComplexityVisualization.
]

{ #category : #testing }
MiPackageBlueprintBrowser >> miSelectedItem [

	^ visualization selected ifNil: [ visualization entities ]
]

{ #category : #testing }
MiPackageBlueprintBrowser >> needUpdate: anEntity [

	^ anEntity ~= visualization entities
]
