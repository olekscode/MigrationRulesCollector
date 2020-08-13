Class {
	#name : #InvalidRuleCategory,
	#superclass : #TransformingCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
InvalidRuleCategory >> condition [ 
	^ ValidRuleCategory new condition not
]

{ #category : #accessing }
InvalidRuleCategory >> name [
	^ 'Invalid'
]
