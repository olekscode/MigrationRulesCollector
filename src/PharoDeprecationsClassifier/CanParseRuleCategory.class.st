Class {
	#name : #CanParseRuleCategory,
	#superclass : #TransformingCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
CanParseRuleCategory >> condition [ 
	^ CanNotParseRuleCategory new condition not
]

{ #category : #accessing }
CanParseRuleCategory >> name [
	^ 'Can be parsed without errors'
]
