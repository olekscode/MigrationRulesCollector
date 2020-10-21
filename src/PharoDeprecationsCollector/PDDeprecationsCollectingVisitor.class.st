Class {
	#name : #PDDeprecationsCollectingVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'deprecationSelector',
		'deprecations'
	],
	#category : #PharoDeprecationsCollector
}

{ #category : #accessing }
PDDeprecationsCollectingVisitor >> deprecations [
	^ deprecations
]

{ #category : #'as yet unclassified' }
PDDeprecationsCollectingVisitor >> extractTransformationRuleFrom: aNode [
	| antecedent consequent |
	(aNode isMessage and: [ aNode selector = #-> ])
		ifFalse: [ ^ nil ].
		
	antecedent := aNode receiver value.
	consequent := aNode arguments first value.
	
	(antecedent isString and: [ consequent isString ])
		ifFalse: [ ^ nil ].
	
	^ TransformationRule
		antecedent: 	antecedent
		consequent: consequent.
]

{ #category : #initialization }
PDDeprecationsCollectingVisitor >> initialize [
	super initialize.
	deprecations := OrderedCollection new.
]

{ #category : #visiting }
PDDeprecationsCollectingVisitor >> visitDeprecated: aMessageNode [
	deprecations add: (PDDeprecation new
		explanation: aMessageNode arguments first value;
		yourself).
]

{ #category : #visiting }
PDDeprecationsCollectingVisitor >> visitDeprecatedOnIn: aMessageNode [
	deprecations add: (PDDeprecation new
		explanation: aMessageNode arguments first value;
		date: aMessageNode arguments second evaluate;
		version: aMessageNode arguments third value;
		yourself).
]

{ #category : #visiting }
PDDeprecationsCollectingVisitor >> visitDeprecatedOnInTransformWith: aMessageNode [
	| ruleNode |
	ruleNode := aMessageNode arguments fourth.

	deprecations add: (PDDeprecation new
		explanation: aMessageNode arguments first value;
		date: aMessageNode arguments second evaluate;
		version: aMessageNode arguments third value;
		transformationRule: (self extractTransformationRuleFrom: ruleNode);
		yourself).
]

{ #category : #visiting }
PDDeprecationsCollectingVisitor >> visitDeprecatedOnInTransformWithWhen: aMessageNode [
	| ruleNode |
	ruleNode := aMessageNode arguments fourth.

	deprecations add: (PDDeprecation new
		explanation: aMessageNode arguments first value;
		date: aMessageNode arguments second evaluate;
		version: aMessageNode arguments third value;
		transformationRule: (self extractTransformationRuleFrom: ruleNode);
		transformationCondition: aMessageNode arguments fifth evaluate;
		yourself).
]

{ #category : #visiting }
PDDeprecationsCollectingVisitor >> visitDeprecatedTransformWith: aMessageNode [
	| ruleNode |
	ruleNode := aMessageNode arguments second.

	deprecations add: (PDDeprecation new
		explanation: aMessageNode arguments first value;
		transformationRule: (self extractTransformationRuleFrom: ruleNode);
		yourself).
]

{ #category : #visiting }
PDDeprecationsCollectingVisitor >> visitDeprecatedTransformWithWhen: aMessageNode [
	| ruleNode |
	ruleNode := aMessageNode arguments second.

	deprecations add: (PDDeprecation new
		explanation: aMessageNode arguments first value;
		transformationRule: (self extractTransformationRuleFrom: ruleNode);
		transformationCondition: aMessageNode arguments third evaluate;
		yourself).
]

{ #category : #visiting }
PDDeprecationsCollectingVisitor >> visitMessageNode: aMessageNode [
	| options |
	
	options := { 
		#deprecated: -> [ self visitDeprecated: aMessageNode ] .
		#deprecated:on:in: -> [ self visitDeprecatedOnIn: aMessageNode ] .
		#deprecated:on:in:transformWith: -> [ self visitDeprecatedOnInTransformWith: aMessageNode ] .
		#deprecated:on:in:transformWith:when: -> [ self visitDeprecatedOnInTransformWithWhen: aMessageNode ] .
		#deprecated:transformWith: -> [ self visitDeprecatedTransformWith: aMessageNode ] .
		#deprecated:transformWith:when: -> [ self visitDeprecatedTransformWithWhen: aMessageNode ]
	} asDictionary.
	
	options at: aMessageNode selector
		ifPresent: [ :aBlock | aBlock value ].
		
	super visitMessageNode: aMessageNode.
]
