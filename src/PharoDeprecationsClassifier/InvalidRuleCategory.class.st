Class {
	#name : #InvalidRuleCategory,
	#superclass : #CanParseRuleCategory,
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
