Class {
	#name : #MiSystemComplexityDropListsPresenter,
	#superclass : #MiPresenter,
	#instVars : [
		'colorDropList',
		'heightDropList',
		'widthDropList',
		'items'
	],
	#category : #'Perso-Visualization-RImplementation'
}

{ #category : #specs }
MiSystemComplexityDropListsPresenter class >> defaultSpec [

	^ SpGridLayout new
		  add: 'Select metric for color:' at: 1 @ 1;
		  add: #colorDropList at: 2 @ 1;
		  add: 'Select metric for height:' at: 1 @ 2;
		  add: #heightDropList at: 2 @ 2;
		  add: 'Select metric for width:' at: 1 @ 3;
		  add: #widthDropList at: 2 @ 3;
		  yourself
]

{ #category : #accessing }
MiSystemComplexityDropListsPresenter >> colorDropList [

	^ colorDropList
]

{ #category : #'instance creation' }
MiSystemComplexityDropListsPresenter >> defaultColorMetrics [
	^ #numberOfLinesOfCode
]

{ #category : #'instance creation' }
MiSystemComplexityDropListsPresenter >> defaultHeightMetrics [

	^ #numberOfMethods
]

{ #category : #'instance creation' }
MiSystemComplexityDropListsPresenter >> defaultWidthMetrics [

	^ #numberOfAttributes
]

{ #category : #accessing }
MiSystemComplexityDropListsPresenter >> heightDropList [

	^ heightDropList
]

{ #category : #initialization }
MiSystemComplexityDropListsPresenter >> initializePresenters [

	"self halt."

	colorDropList := self newDropList
		                 help: 'Select the metric for color.';
		                 items: self items;
		                 selectItem: self defaultColorMetrics.

	heightDropList := self newDropList help:
		                  'Select the metric for height.';
		                 items: self items;
		                 selectItem: self defaultHeightMetrics .

	widthDropList := self newDropList help:
		                 'Select the metric for width.';
		                 items: self items;
		                 selectItem: self defaultWidthMetrics 
]

{ #category : #accessing }
MiSystemComplexityDropListsPresenter >> items [

	^ items ifNil: [ 
		  items := { 
			           self defaultColorMetrics.
			           self defaultHeightMetrics.
			           self defaultWidthMetrics } ]
]

{ #category : #accessing }
MiSystemComplexityDropListsPresenter >> items: aMetrics [

	aMetrics ifEmpty: [ 
		aMetrics addAll: { 
				self defaultColorMetrics.
				self defaultHeightMetrics.
				self defaultWidthMetrics } ].
	items := aMetrics.
	self updateDropLists: aMetrics
]

{ #category : #'instance creation' }
MiSystemComplexityDropListsPresenter >> newDropList [

	^ SpDropListPresenter new display: [ :aMetric | aMetric asString ]
]

{ #category : #accessing }
MiSystemComplexityDropListsPresenter >> retrieveMetrics: anEntity [

	| entities |
	self flag: #TODO. " gerer un groupe vide "
	entities := anEntity asMooseGroup anyOne allToScope: FamixTClass.
	^ entities ifEmpty: [ OrderedCollection new ] ifNotEmpty: [ 
		  ((entities anyOne class famePropertiesOfType: FM3Number) collect: [ 
			   :property | property implementingSelector ]) sorted:
			  #yourself ascending ]
]

{ #category : #accessing }
MiSystemComplexityDropListsPresenter >> selectIndex: metrics [

	self colorDropList selectIndex: (metrics at: 1).
	self heightDropList selectIndex: (metrics at: 2).
	self widthDropList selectIndex: (metrics at: 3)
]

{ #category : #accessing }
MiSystemComplexityDropListsPresenter >> selectedIndex [
	^ OrderedCollection new
		add: self colorDropList selectedIndex;
		add: self heightDropList selectedIndex;
		add: self widthDropList selectedIndex;
		yourself 
]

{ #category : #accessing }
MiSystemComplexityDropListsPresenter >> updateDropLists: aMetrics [

	self colorDropList
		items: aMetrics;
		selectItem: self defaultColorMetrics.

	self heightDropList
		items: aMetrics;
		selectItem: self defaultHeightMetrics.

	self widthDropList
		items: aMetrics;
		selectItem: self defaultWidthMetrics
]

{ #category : #accessing }
MiSystemComplexityDropListsPresenter >> widthDropList [

	^ widthDropList
]
