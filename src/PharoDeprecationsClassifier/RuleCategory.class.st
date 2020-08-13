Class {
	#name : #RuleCategory,
	#superclass : #Category,
	#category : #PharoDeprecationsClassifier
}

{ #category : #initialization }
RuleCategory >> initialize [ 
	super initialize.
	self addSubcategories: (self class subclasses collect: [ :each | each new ]).
]

{ #category : #accessing }
RuleCategory >> name [
	^ 'All rules'
]
