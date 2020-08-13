Class {
	#name : #PDDeprecationsCollectorTest,
	#superclass : #TestCase,
	#category : #'PharoDeprecationsCollector-Tests'
}

{ #category : #'as yet unclassified' }
PDDeprecationsCollectorTest >> mockDeprecatedOnInTransformWith [
	self
		deprecated: 'This method is deprecated for some reason'
		on: '3/18/1996' asDate
		in: 'v2.1.0'
		transformWith: '`@receiver basicDescription: `@arg' -> '`@receiver description: `@arg'.
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollectorTest >> mockDeprecatedOnInTransformWithWhen [
	self
		deprecated: 'This method is deprecated for some reason'
		on: '3/18/1996' asDate
		in: 'v2.1.0'
		transformWith: '`@receiver basicDescription: `@arg' -> '`@receiver description: `@arg'
		when: [ true ] .
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollectorTest >> mockDeprecatedTransformWith [
	self
		deprecated: 'This method is deprecated for some reason'
		transformWith: '`@receiver basicDescription: `@arg' -> '`@receiver description: `@arg'.
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollectorTest >> mockDeprecatedTransformWithWhen [
	self
		deprecated: 'This method is deprecated for some reason'
		transformWith: '`@receiver basicDescription: `@arg' -> '`@receiver description: `@arg'
		when: [ true ] .
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollectorTest >> testDeprecatedOnInTransformWith [
	| collector actual expected |
	
	collector := PDDeprecationsCollector new.
	actual := collector collectDeprecationsFromMethod: self class >> #mockDeprecatedOnInTransformWith.
	
	expected := OrderedCollection withAll: { 
		PDDeprecation new
			explanation: 'This method is deprecated for some reason';
			date: '3/18/1996' asDate;
			version: 'v2.1.0';
			method: self class >> #mockDeprecatedOnInTransformWith;
			transformationRule: (PDTransformationRule new
				antecedent: '`@receiver basicDescription: `@arg';
				consequent: '`@receiver description: `@arg';
				yourself);
			yourself }.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollectorTest >> testDeprecatedOnInTransformWithWhen [
	| collector actual expected |
	
	collector := PDDeprecationsCollector new.
	actual := collector collectDeprecationsFromMethod: self class >> #mockDeprecatedOnInTransformWithWhen.
	
	expected := OrderedCollection withAll: { 
		PDDeprecation new
			explanation: 'This method is deprecated for some reason';
			date: '3/18/1996' asDate;
			version: 'v2.1.0';
			method: self class >> #mockDeprecatedOnInTransformWithWhen;
			transformationRule: (PDTransformationRule new
				antecedent: '`@receiver basicDescription: `@arg';
				consequent: '`@receiver description: `@arg';
				yourself);
			transformationCondition: [ true ];
			yourself }.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollectorTest >> testDeprecatedTransformWith [
	| collector actual expected |
	
	collector := PDDeprecationsCollector new.
	actual := collector collectDeprecationsFromMethod: self class >> #mockDeprecatedTransformWith.
	
	expected := OrderedCollection withAll: { 
		PDDeprecation new
			explanation: 'This method is deprecated for some reason';
			method: self class >> #mockDeprecatedTransformWith;
			transformationRule: (PDTransformationRule new
				antecedent: '`@receiver basicDescription: `@arg';
				consequent: '`@receiver description: `@arg';
				yourself);
			yourself }.
	
	self assert: actual equals: expected.
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollectorTest >> testDeprecatedTransformWithWhen [
	| collector actual expected |
	
	collector := PDDeprecationsCollector new.
	actual := collector collectDeprecationsFromMethod: self class >> #mockDeprecatedTransformWithWhen.
	
	expected := OrderedCollection withAll: { 
		PDDeprecation new
			explanation: 'This method is deprecated for some reason';
			method: self class >> #mockDeprecatedTransformWithWhen;
			transformationRule: (PDTransformationRule new
				antecedent: '`@receiver basicDescription: `@arg';
				consequent: '`@receiver description: `@arg';
				yourself);
			transformationCondition: [ true ];
			yourself }.
	
	self assert: actual equals: expected.
]
