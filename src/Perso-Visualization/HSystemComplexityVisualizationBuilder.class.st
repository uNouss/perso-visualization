Class {
	#name : #HSystemComplexityVisualizationBuilder,
	#superclass : #HNodeBuilder,
	#instVars : [
		'entities',
		'colorPalette'
	],
	#category : #'Perso-Visualization-Implementation'
}

{ #category : #building }
HSystemComplexityVisualizationBuilder >> build [

	"self halt."

	rootNode := HNode new
		            name: 'Root';
		            addAll:
			            (self entities collect: [ :pkg | 
					             self buildNodeFromPackage: pkg ]).
	self updateNode: rootNode
]

{ #category : #building }
HSystemComplexityVisualizationBuilder >> buildNodeFromClass: aClass [

	^ HNode new
		  name: aClass name;
		  rawModel: aClass;
		  iconName: #class;
		  addAll:
			  (aClass definedClasses collect: [ :cls | 
					   self buildNodeFromClass: cls ]);
		  yourself
]

{ #category : #building }
HSystemComplexityVisualizationBuilder >> buildNodeFromClassBak: aClass [

	^ HNode new
		  name: aClass name;
		  rawModel: aClass;
		  iconName: self mooseIcon name;
		  addAll:
			  (aClass definedClasses collect: [ :cls | 
					   self buildNodeFromClass: cls ]);
		  yourself
]

{ #category : #building }
HSystemComplexityVisualizationBuilder >> buildNodeFromEntity: anEntity [

	"self halt."

	^ anEntity buildNodeFromEntity
]

{ #category : #building }
HSystemComplexityVisualizationBuilder >> buildNodeFromPackage: aPackage [

	| node |
	node := HNode new
		        name: aPackage name;
		        rawModel: aPackage;
		        iconName: aPackage icon name;
		        collapse;
		        yourself.
	aPackage children do: [ :child | 
		node addAll: (self buildNodeFromEntity: child) ].
	^ node
]

{ #category : #building }
HSystemComplexityVisualizationBuilder >> buildNodeFromPackageBak: aPackage [

	"
	| node debug |

	node := HNode new
		        name: aPackage name;
		        rawModel: aPackage;
		        iconName: #monticelloPackage;
		        yourself.
	debug := aPackage children.
	debug collect: [ :child | 
		node addAll: (self buildNodeFromEntity: child) ].
	node collapse.
	^ node"

	^ HNode new
		  name: aPackage name;
		  rawModel: aPackage;
		  iconName: #monticelloPackage;
		  addAll: (aPackage definedClasses collect: [ :cls | 
					   self buildNodeFromClass: cls ]);
		  yourself
]

{ #category : #building }
HSystemComplexityVisualizationBuilder >> buildNodeFromPackageOld: aPackage [

	| node debug |
	node := HNode new
		        name: aPackage name;
		        rawModel: aPackage;
		        iconName: #monticelloPackage;
		        yourself.
	debug := aPackage children.
	debug collect: [ :child | 
		node addAll: (self buildNodeFromEntity: child) ].
	node collapse.
	^ node
]

{ #category : #accessing }
HSystemComplexityVisualizationBuilder >> colorPalette [
	^ colorPalette 
]

{ #category : #accessing }
HSystemComplexityVisualizationBuilder >> colorPalette: aNSOrdinalScale [
	colorPalette := aNSOrdinalScale
]

{ #category : #accessing }
HSystemComplexityVisualizationBuilder >> entities [

	^ entities
]

{ #category : #accessing }
HSystemComplexityVisualizationBuilder >> entities: anObject [

	entities := anObject
]

{ #category : #initialization }
HSystemComplexityVisualizationBuilder >> initialize [

	super initialize.
	self colorPalette:
		(NSScale category10 in: [ :s | s range: { Color gray } , s range ])
]

{ #category : #initialization }
HSystemComplexityVisualizationBuilder >> initializeBak [

	super initialize.
	self colorPalette:
		(NSScale ordinal range: (ClpSequentialPaletteGenerator new
				  startColor: Color white endColor: Color black;
				  generate: 10) asCollection)
]

{ #category : #initialization }
HSystemComplexityVisualizationBuilder >> initializeOld [

	super initialize.
	self colorPalette:
		(NSScale category20 in: [ :s | s range: { Color gray } , s range ])
]

{ #category : #updating }
HSystemComplexityVisualizationBuilder >> updateNode: node [

	"self halt."

	node color:
		((NSScale ordinal range: (ClpSequentialPaletteGenerator new
				   startColor: Color white endColor: Color black;
				   generate: 10) asCollection) scale: node level).
	node children do: [ :child | self updateNode: child ]
]

{ #category : #updating }
HSystemComplexityVisualizationBuilder >> updateNodeOld: node [

	node color: (self colorPalette scale: node level).
	node children do: [ :child | self updateNode: child ]
]
