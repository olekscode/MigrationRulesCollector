Class {
	#name : #InvalidRuleCategory,
	#superclass : #RewriterRuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #accessing }
InvalidRuleCategory >> condition [ 
	^ ValidRuleCategory new condition not
]

{ #category : #accessing }
InvalidRuleCategory >> name [
	^ 'Invalid'
]
