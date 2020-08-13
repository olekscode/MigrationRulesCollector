Class {
	#name : #AddedUnaryMessageRuleCategory,
	#superclass : #OneToManyRuleCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> condition [ 
	^ [ :deprecation |
		| rule |
		rule := deprecation transformationRule.
		
		rule consequentTree isMessage and: [
		rule consequentTree receiver isMessage and: [ 
			(self isUnaryMessageAddedBefore: rule) or: [ 
				self isUnaryMessageAddedAfter: rule ] ] ] ]
]

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> isUnaryMessageAddedAfter: aRule [
	^ aRule consequentTree arguments isEmpty and: [
		aRule consequentTree receiver arguments = aRule antecedentTree arguments ]
]

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> isUnaryMessageAddedBefore: aRule [
	^ aRule consequentTree receiver arguments isEmpty and: [
		aRule consequentTree arguments = aRule antecedentTree arguments ]
]

{ #category : #accessing }
AddedUnaryMessageRuleCategory >> name [ 
	^ 'Added unary message'
]
