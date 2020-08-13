Class {
	#name : #MigrationRulesCollectorTest,
	#superclass : #TestCase,
	#category : #'PharoDeprecationsCollector-Tests'
}

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> mockDeprecatedOnInTransformWith [
	self
		deprecated: 'This method is deprecated for some reason'
		on: '3/18/1996' asDate
		in: 'v2.1.0'
		transformWith: '`@receiver basicDescription: `@arg' -> '`@receiver description: `@arg'.
]

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> mockDeprecatedOnInTransformWithWhen [
	self
		deprecated: 'This method is deprecated for some reason'
		on: '3/18/1996' asDate
		in: 'v2.1.0'
		transformWith: '`@receiver basicDescription: `@arg' -> '`@receiver description: `@arg'
		when: [ true ] .
]

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> mockDeprecatedTransformWith [
	self
		deprecated: 'This method is deprecated for some reason'
		transformWith: '`@receiver basicDescription: `@arg' -> '`@receiver description: `@arg'.
]

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> mockDeprecatedTransformWithWhen [
	self
		deprecated: 'This method is deprecated for some reason'
		transformWith: '`@receiver basicDescription: `@arg' -> '`@receiver description: `@arg'
		when: [ true ] .
]

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> testDeprecatedOnInTransformWith [
	| collector expected |
	
	collector := MigrationRulesCollector new.
	collector collectRulesFromMethod: self class >> #mockDeprecatedOnInTransformWith.
	
	expected := OrderedCollection withAll: { 
		RewriterRule new
			antecedent: '`@receiver basicDescription: `@arg';
			consequent: '`@receiver description: `@arg';
			explanation: 'This method is deprecated for some reason';
			date: '3/18/1996' asDate;
			version: 'v2.1.0';
			method: self class >> #mockDeprecatedOnInTransformWith;
			yourself }.
	
	self assert: collector rules equals: expected.
]

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> testDeprecatedOnInTransformWithWhen [
	| collector expected |
	
	collector := MigrationRulesCollector new.
	collector collectRulesFromMethod: self class >> #mockDeprecatedOnInTransformWithWhen.
	
	expected := OrderedCollection withAll: { 
		RewriterRule new
			antecedent: '`@receiver basicDescription: `@arg';
			consequent: '`@receiver description: `@arg';
			explanation: 'This method is deprecated for some reason';
			date: '3/18/1996' asDate;
			version: 'v2.1.0';
			condition: [ true ];
			method: self class >> #mockDeprecatedOnInTransformWithWhen;
			yourself }.
	
	self assert: collector rules equals: expected.
]

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> testDeprecatedTransformWith [
	| collector expected |
	
	collector := MigrationRulesCollector new.
	collector collectRulesFromMethod: self class >> #mockDeprecatedTransformWith.
	
	expected := OrderedCollection withAll: { 
		RewriterRule new
			antecedent: '`@receiver basicDescription: `@arg';
			consequent: '`@receiver description: `@arg';
			explanation: 'This method is deprecated for some reason';
			method: self class >> #mockDeprecatedTransformWith;
			yourself }.
	
	self assert: collector rules equals: expected.
]

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> testDeprecatedTransformWithWhen [
	| collector expected |
	
	collector := MigrationRulesCollector new.
	collector collectRulesFromMethod: self class >> #mockDeprecatedTransformWithWhen.
	
	expected := OrderedCollection withAll: { 
		RewriterRule new
			antecedent: '`@receiver basicDescription: `@arg';
			consequent: '`@receiver description: `@arg';
			explanation: 'This method is deprecated for some reason';
			condition: [ true ];
			method: self class >> #mockDeprecatedTransformWithWhen;
			yourself }.
	
	self assert: collector rules equals: expected.
]
