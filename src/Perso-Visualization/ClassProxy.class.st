Class {
	#name : #ClassProxy,
	#superclass : #Object,
	#instVars : [
		'aClass',
		'references',
		'numberOfReferences'
	],
	#category : #'Perso-Visualization-PackageBlueprint'
}

{ #category : #accessing }
ClassProxy >> aClass [

	^ aClass
]

{ #category : #accessing }
ClassProxy >> aClass: anObject [

	aClass := anObject
]

{ #category : #accessing }
ClassProxy >> initialize [

	super initialize.
	numberOfReferences := 0.
	references := #()
]

{ #category : #accessing }
ClassProxy >> numberOfReferences [

	^ numberOfReferences
]

{ #category : #accessing }
ClassProxy >> numberOfReferences: anObject [

	numberOfReferences := anObject
]

{ #category : #accessing }
ClassProxy >> references [

	^ references
]

{ #category : #accessing }
ClassProxy >> references: anObject [

	references := anObject
]
