Class {
	#name : #HSystemComplexityVisualizationBuilderTest,
	#superclass : #TestCase,
	#category : #'Perso-Visualization-Tests'
}

{ #category : #running }
HSystemComplexityVisualizationBuilderTest >> setUp [

	| builder |
	super setUp.
	"Put here a common initialization logic for tests"

	builder := HSystemComplexityVisualizationBuilder new build.
]

{ #category : #running }
HSystemComplexityVisualizationBuilderTest >> tearDown [

	
	super tearDown
]

{ #category : #tests }
HSystemComplexityVisualizationBuilderTest >> testBuild [

	| builder |
	builder := HSystemComplexityVisualizationBuilder new build.
	self assert: builder rootNode name equals: 'Root'
]
