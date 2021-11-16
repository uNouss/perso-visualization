Class {
	#name : #MiSystemComplexityBrowserTest,
	#superclass : #MiAbstractBrowserTest,
	#category : #'Perso-Visualization-Tests'
}

{ #category : #running }
MiSystemComplexityBrowserTest >> browserClass [

	^ MiSystemComplexityBrowser
]

{ #category : #running }
MiSystemComplexityBrowserTest >> mooseObjects [

	^ { 
		  FamixStPackage new.
		  MooseGroup new.
		  (MooseGroup with: FamixStPackage new).
		  FamixStModel new.
		  (FamixStModel with: FamixStPackage new) }
]

{ #category : #running }
MiSystemComplexityBrowserTest >> testCanOpenOnMooseEntity [

	| newBrowser |
	self bus globallySelect: FamixStEntity new.
	self
		shouldnt: [ 
			newBrowser := self browserClass openForTests.
			newBrowser window close ]
		raise: Error
]

{ #category : #running }
MiSystemComplexityBrowserTest >> testFollowBusTriggersSelectEntity [

	| propagatedEntity |
	propagatedEntity := FamixStPackage new.

	browser stub.

	self bus globallySelect: propagatedEntity.

	browser followBus: self bus.
	browser should receive selectEntity: propagatedEntity
]
