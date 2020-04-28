Class {
	#name : #DeprecationCategory,
	#superclass : #RuleCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #accessing }
DeprecationCategory >> condition [
	^ RewriterRuleCategory new condition not
]

{ #category : #accessing }
DeprecationCategory >> name [
	^ 'Deprecations'
]
