Class {
	#name : #MiSystemComplexityBrowser,
	#superclass : #MiAbstractBrowser,
	#instVars : [
		'visualization',
		'isPackage',
		'metricsWidget'
	],
	#category : #'Perso-Visualization-RImplementation'
}

{ #category : #specs }
MiSystemComplexityBrowser class >> defaultSpec [

	"(SpGridLayout new
				   add: 'Select metric for color:' at: 1 @ 1;
				   add: #colorDropList at: 2 @ 1;
				   add: 'Select metric for height:' at: 1 @ 2;
				   add: #heightDropList at: 2 @ 2;
				   add: 'Select metric for width:' at: 1 @ 3;
				   add: #widthDropList at: 2 @ 3;
				   yourself)"

	^ super defaultSpec
		  add: #visualization;
		  add: #metricsWidget;
		  yourself
]

{ #category : #'world menu' }
MiSystemComplexityBrowser class >> menuCommandOn: aBuilder [

	<worldMenu>
	<miBrowsers>
	(aBuilder item: #SystemComplexity)
		parent: #Moose;
		label: self title;
		icon: (self iconNamed: #smallInspect);
		order: 6;
		help: self helpMessage;
		action: [ self open ]
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
MiSystemComplexityBrowser >> canReceiveEntity: anEntity [

	self flag: #FIXME. " gerer une entité nil "
	anEntity ifNil: [ ^ false ].
	self isPackage: anEntity.
	^ (self needUpdate: anEntity) and: [ 
		  (anEntity asMooseSpecializedGroup isKindOf: FamixTypeGroup) or: [ 
			  self isPackage ] ]
]

{ #category : #actions }
MiSystemComplexityBrowser >> followEntity: anEntity [

	"self halt."

	visualization entities: (self isPackage
			 ifTrue: [ anEntity allToScope: FamixTClass ]
			 ifFalse: [ anEntity asMooseSpecializedGroup ]).

	visualization isRunned
		ifTrue: [ self visualization run ]
		ifFalse: [ 
			metricsWidget items: (metricsWidget retrieveMetrics: anEntity) ]
]

{ #category : #initialization }
MiSystemComplexityBrowser >> initializePresenters [

	"Comment on fait pour setter la metric choisi"

	super initializePresenters.
	visualization := self instantiate: MiSystemComplexityVisualization.
	metricsWidget := self instantiate:
		                 MiSystemComplexityDropListsPresenter.

	"self halt."

	metricsWidget colorDropList whenSelectedItemChangedDo: [ :aMetric | 
		visualization color: aMetric.
		visualization run ].

	metricsWidget heightDropList whenSelectedItemChangedDo: [ :aMetric | 
		visualization height: aMetric.
		visualization run ].

	metricsWidget widthDropList whenSelectedItemChangedDo: [ :aMetric | 
		visualization width: aMetric.
		visualization run ]
]

{ #category : #accessing }
MiSystemComplexityBrowser >> isPackage [

	^ isPackage ifNil: [ isPackage := false ]
]

{ #category : #accessing }
MiSystemComplexityBrowser >> isPackage: anEntity [

	isPackage := anEntity isMooseObject and: [(anEntity isOfType: FamixTPackage) and: [ 
		             anEntity isStub not ]]
]

{ #category : #accessing }
MiSystemComplexityBrowser >> metricsWidget [

	^ metricsWidget
]

{ #category : #accessing }
MiSystemComplexityBrowser >> metricsWidget: aMetricsItems [

	metricsWidget := aMetricsItems
]

{ #category : #initialization }
MiSystemComplexityBrowser >> miSelectedItem [ 
^	visualization selected ifNil: [ visualization entities  ]
]

{ #category : #initialization }
MiSystemComplexityBrowser >> needUpdate: anEntity [

	^ anEntity ~= visualization entities
]

{ #category : #actions }
MiSystemComplexityBrowser >> retrieveMetrics: anEntity [

	| entities |
	self flag: #TODO. " gerer un groupe vide "
	entities := anEntity asMooseGroup anyOne allToScope: FamixTClass.
	^ entities ifEmpty: [ OrderedCollection new ] ifNotEmpty: [ 
		  ((entities anyOne class famePropertiesOfType: FM3Number) collect: [ 
			   :property | property implementingSelector ]) sorted:
			  #yourself ascending ]
]

{ #category : #'updating - interaction' }
MiSystemComplexityBrowser >> updateVisualizationWhenDropListChanged [

	"self halt."
	metricsWidget colorDropList whenSelectedItemChangedDo: [ 
		:aColorMetric | 
		metricsWidget colorDropList selectItem: aColorMetric ].

	metricsWidget heightDropList whenSelectedItemChangedDo: [ 
		:aHeightMetric | 
		metricsWidget heightDropList selectItem: aHeightMetric ].

	metricsWidget widthDropList whenSelectedItemChangedDo: [ 
		:aWidthMetric | 
		metricsWidget widthDropList selectItem: aWidthMetric ].
	
self visualization run
]

{ #category : #accessing }
MiSystemComplexityBrowser >> visualization [

	^ visualization
]

{ #category : #accessing }
MiSystemComplexityBrowser >> visualization: aVisualization [

	visualization := aVisualization
]
