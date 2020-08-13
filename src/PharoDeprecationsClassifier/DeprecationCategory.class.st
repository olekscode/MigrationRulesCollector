Class {
	#name : #DeprecationCategory,
	#superclass : #RuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
DeprecationCategory >> condition [
	^ RewriterRuleCategory new condition not
]

{ #category : #accessing }
DeprecationCategory >> name [
	^ 'Deprecations'
]
