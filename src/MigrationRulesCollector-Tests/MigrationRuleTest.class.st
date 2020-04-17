Class {
	#name : #MigrationRuleTest,
	#superclass : #TestCase,
	#category : #'MigrationRulesCollector-Tests'
}

{ #category : #tests }
MigrationRuleTest >> testEquality [
	| rule sameRule |
	
	rule := RewriterRule new
		antecedent: '`@receiver basicDescription: `@arg';
		consequent: '`@receiver description: `@arg';
		method: self class >> #testEquality;
		yourself.
		
	sameRule := RewriterRule new
		antecedent: '`@receiver basicDescription: `@arg';
		consequent: '`@receiver description: `@arg';
		method: self class >> #testEquality;
		yourself.
		
	self assert: rule equals: sameRule.
]

{ #category : #tests }
MigrationRuleTest >> testInequalityDifferentAntecedent [
	| rule differentRule |
	
	rule := RewriterRule new
		antecedent: '`@receiver basicDescription: `@arg';
		consequent: '`@receiver description: `@arg';
		method: self class >> #testEquality;
		yourself.
		
	differentRule := RewriterRule new
		antecedent: '`@receiver basicDescription';
		consequent: '`@receiver description: `@arg';
		method: self class >> #testEquality;
		yourself.
		
	self deny: rule equals: differentRule.
]

{ #category : #tests }
MigrationRuleTest >> testInequalityDifferentConsequent [
	| rule differentRule |
	
	rule := RewriterRule new
		antecedent: '`@receiver basicDescription: `@arg';
		consequent: '`@receiver description: `@arg';
		method: self class >> #testEquality;
		yourself.
		
	differentRule := RewriterRule new
		antecedent: '`@receiver basicDescription: `@arg';
		consequent: '`@receiver description';
		method: self class >> #testEquality;
		yourself.
		
	self deny: rule equals: differentRule.
]

{ #category : #tests }
MigrationRuleTest >> testInequalityDifferentMethod [
	| rule differentRule |
	
	rule := RewriterRule new
		antecedent: '`@receiver basicDescription: `@arg';
		consequent: '`@receiver description: `@arg';
		method: self class >> #testEquality;
		yourself.
		
	differentRule := RewriterRule new
		antecedent: '`@receiver basicDescription: `@arg';
		consequent: '`@receiver description: `@arg';
		method: self class >> #testInequalityDifferentMethod;
		yourself.
		
	self deny: rule equals: differentRule.
]
