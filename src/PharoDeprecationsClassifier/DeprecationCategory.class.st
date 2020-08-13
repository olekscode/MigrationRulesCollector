Class {
	#name : #DeprecationCategory,
	#superclass : #Category,
	#category : #PharoDeprecationsClassifier
}

{ #category : #initialization }
DeprecationCategory >> initialize [ 
	super initialize.
	self addSubcategories: (self class subclasses collect: [ :each | each new ]).
]

{ #category : #accessing }
DeprecationCategory >> name [
	^ 'All rules'
]
