Class {
	#name : #InvalidRuleCategory,
	#superclass : #RewriterRuleCategory,
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
