Extension { #name : #FamixStMethod }

{ #category : #'*Perso-Visualization' }
FamixStMethod >> buildNodeFromEntity [
	|method|
	method := Set new.
	method add: (HNode new
			   name: self name;
			   rawModel: self;
			   yourself).
	^ method
]
