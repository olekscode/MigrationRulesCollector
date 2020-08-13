Class {
	#name : #PDTransformationRuleValidator,
	#superclass : #Object,
	#category : #PharoDeprecationsCollector
}

{ #category : #testing }
PDTransformationRuleValidator >> isAntecedentAndConsequentNonEmpty: aRule [
	^ aRule antecedent isNotEmpty and: [ aRule consequent isNotEmpty ]
]

{ #category : #testing }
PDTransformationRuleValidator >> isAntecedentDifferentFromConsequent: aRule [
	^ aRule antecedent ~= aRule consequent
]

{ #category : #testing }
PDTransformationRuleValidator >> isAntecedentSameAsDeprecatedSelector: aRule [
	^ aRule antecedentTree isMessage and: [
		aRule antecedentTree selector = aRule deprecation method selector ]
]

{ #category : #testing }
PDTransformationRuleValidator >> isValid: aRule [
	^ (self isAntecedentSameAsDeprecatedSelector: aRule) and: [
		(self isAntecedentAndConsequentNonEmpty: aRule) and: [ 
			(self isAntecedentDifferentFromConsequent: aRule) ] ].
]
