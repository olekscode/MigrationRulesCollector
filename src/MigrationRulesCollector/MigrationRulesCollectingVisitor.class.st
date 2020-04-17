Class {
	#name : #MigrationRulesCollectingVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'rules',
		'deprecationSelector'
	],
	#category : #MigrationRulesCollector
}

{ #category : #initialization }
MigrationRulesCollectingVisitor >> initialize [
	super initialize.
	rules := OrderedCollection new.
]

{ #category : #accessing }
MigrationRulesCollectingVisitor >> rules [
	^ rules
]

{ #category : #visiting }
MigrationRulesCollectingVisitor >> visitDeprecated: aMessageNode [
	rules add: (DeprecationRule new
		explanation: aMessageNode arguments first value;
		yourself).
]

{ #category : #visiting }
MigrationRulesCollectingVisitor >> visitDeprecatedOnIn: aMessageNode [
	rules add: (DeprecationRule new
		explanation: aMessageNode arguments first value;
		date: aMessageNode arguments second evaluate;
		version: aMessageNode arguments third value;
		yourself).
]

{ #category : #visiting }
MigrationRulesCollectingVisitor >> visitDeprecatedOnInTransformWith: aMessageNode [
	| ruleNode |
	ruleNode := aMessageNode arguments fourth.

	rules add: (MigrationRule new
		antecedent: ruleNode receiver value;
		consequent: ruleNode arguments first value;
		explanation: aMessageNode arguments first value;
		date: aMessageNode arguments second evaluate;
		version: aMessageNode arguments third value;
		yourself).
]

{ #category : #visiting }
MigrationRulesCollectingVisitor >> visitDeprecatedOnInTransformWithWhen: aMessageNode [
	| ruleNode |
	ruleNode := aMessageNode arguments fourth.

	rules add: (MigrationRule new
		antecedent: ruleNode receiver value;
		consequent: ruleNode arguments first value;
		explanation: aMessageNode arguments first value;
		date: aMessageNode arguments second evaluate;
		version: aMessageNode arguments third value;
		condition: aMessageNode arguments fifth evaluate;
		yourself).
]

{ #category : #visiting }
MigrationRulesCollectingVisitor >> visitDeprecatedTransformWith: aMessageNode [
	| ruleNode |
	ruleNode := aMessageNode arguments second.

	rules add: (MigrationRule new
		antecedent: ruleNode receiver value;
		consequent: ruleNode arguments first value;
		explanation: aMessageNode arguments first value;
		yourself).
]

{ #category : #visiting }
MigrationRulesCollectingVisitor >> visitDeprecatedTransformWithWhen: aMessageNode [
	| ruleNode |
	ruleNode := aMessageNode arguments second.

	rules add: (MigrationRule new
		antecedent: ruleNode receiver value;
		consequent: ruleNode arguments first value;
		explanation: aMessageNode arguments first value;
		condition: aMessageNode arguments third evaluate;
		yourself).
]

{ #category : #visiting }
MigrationRulesCollectingVisitor >> visitMessageNode: aMessageNode [
	| options |
	
	options := { 
		#deprecated: -> [ self visitDeprecated: aMessageNode ] .
		#deprecated:on:in:transformWith: -> [ self visitDeprecatedOnInTransformWith: aMessageNode ] .
		#deprecated:on:in:transformWith:when: -> [ self visitDeprecatedOnInTransformWithWhen: aMessageNode ] .
		#deprecated:transformWith: -> [ self visitDeprecatedTransformWith: aMessageNode ] .
		#deprecated:transformWith:when: -> [ self visitDeprecatedTransformWithWhen: aMessageNode ]
	} asDictionary.
	
	options at: aMessageNode selector
		ifPresent: [ :aBlock | aBlock value ]
		ifAbsent: [ ^ self ].
]
