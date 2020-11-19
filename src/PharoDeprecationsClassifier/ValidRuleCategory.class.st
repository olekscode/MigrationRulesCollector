Class {
	#name : #ValidRuleCategory,
	#superclass : #CanParseRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #testing }
ValidRuleCategory >> condition [
	^ [ :deprecation | deprecation transformationRule isValid ]
]

{ #category : #accessing }
ValidRuleCategory >> name [
	^ 'Valid'
]
