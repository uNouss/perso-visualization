Extension { #name : #FamixStClass }

{ #category : #'*Perso-Visualization' }
FamixStClass >> buildNodeFromEntity [

	"
	Manque les méthodes"

	| sub sup nodes pere fils |
	sup := self superclass parentPackage = self parentPackage.
	sub := self directSubclasses.
	"test := self localMethods."

	pere := HNode new
		        name: self name;
		        rawModel: self;
		        iconName: #class;
		        collapse;
		        yourself.
	nodes := Set new.
	sup ifFalse: [ 
		self fixMethodsToNode: pere.
		nodes add: pere.
		sub collect: [ :subCls | 
			fils := HNode new
				        name: subCls name;
				        rawModel: subCls;
				        iconName: #class;
				        collapse;
				        yourself.
			nodes add: fils.
			pere dependencyTo: fils.
			nodes addAll: (subCls buildNodeFromEntity: fils) ] ].
	^ nodes
]

{ #category : #'*Perso-Visualization' }
FamixStClass >> buildNodeFromEntity1: anHNode [

	"Alors ici on sait que ce sont des subClasses dont on a deja crée le noeud. 
Ils peuvent eux memes avoir des subClasses ou pas.
Manque les méthodes"

	| sub nodes pere fils |
	sub := self directSubclasses.
	pere := anHNode.
	nodes := Set new.
	sub collect: [ :subCls | 
		fils := HNode new
			        name: subCls name;
			        rawModel: subCls;
			        collapse;
			        yourself.
		self fixMethodsToNode: fils.
		nodes add: fils.
		pere dependencyTo: fils.
		nodes addAll: (subCls buildNodeFromEntity1: fils) ].
	^ nodes
]

{ #category : #'*Perso-Visualization' }
FamixStClass >> buildNodeFromEntity: anHNode [

	"Alors ici on sait que ce sont des subClasses dont on a deja crée le noeud. 
Ils peuvent eux memes avoir des subClasses ou pas.
Manque les méthodes"

	| sub nodes pere fils |
	"self halt."
	sub := self directSubclasses.
	pere := anHNode.
	nodes := Set new.
	sub do: [ :subCls | 
		fils := HNode new
			        name: subCls name;
			        rawModel: subCls;
			        iconName: #class;
			        collapse;
			        yourself.
		self fixMethodsToNode: fils.
		nodes add: fils.
		pere dependencyTo: fils.
		nodes addAll: (subCls buildNodeFromEntity: fils) ].
	^ nodes
]

{ #category : #'*Perso-Visualization' }
FamixStClass >> fixMethodsToNode: aHNode [

self localMethods  do: [ :method | 
		aHNode add: (HNode new
				 name: method name;
				 rawModel: FamixStMethod;
				 iconName: #glamorousBrowse;
				 yourself) ]
]
