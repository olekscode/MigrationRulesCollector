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
	"If a rule is not linked to a deprecated method we consider this condition satisfied"
	aRule deprecation ifNil: [ ^ true ].

	^ aRule antecedentTree isMessage and: [
		aRule antecedentTree selector = aRule deprecation method selector ]
]

{ #category : #testing }
PDTransformationRuleValidator >> isValid: aRule [
	^ (self isAntecedentSameAsDeprecatedSelector: aRule) and: [
		(self isAntecedentAndConsequentNonEmpty: aRule) and: [ 
			(self isAntecedentDifferentFromConsequent: aRule) ] ].
]
