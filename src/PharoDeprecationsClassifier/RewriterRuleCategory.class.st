Class {
	#name : #RewriterRuleCategory,
	#superclass : #RuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
RewriterRuleCategory >> condition [
	^ [ :rule | rule isRewriterRule ]
]

{ #category : #accessing }
RewriterRuleCategory >> name [
	^ 'Rewriter rules'
]
