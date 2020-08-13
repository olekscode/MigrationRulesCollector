# PharoDeprecationsCollector

[![Build Status](https://travis-ci.org/olekscode/PharoDeprecationsCollector.svg?branch=master)](https://travis-ci.org/olekscode/PharoDeprecationsCollector)
[![Build status](https://ci.appveyor.com/api/projects/status/ify7vkcfe4a5gp6b?svg=true)](https://ci.appveyor.com/project/olekscode/migrationrulesminer)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/PharoDeprecationsCollector/badge.svg?branch=master)](https://coveralls.io/github/olekscode/PharoDeprecationsCollector?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/PharoDeprecationsCollector/master/LICENSE)

A tool for collecting deprecations from a Pharo image, validating them, and classifying them into several pre-defined categories. Part of the research of the on-the-fly deprecation rewriting.

## How to install it?

To install `PharoDeprecationsCollector`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'PharoDeprecationsCollector';
  repository: 'github://olekscode/PharoDeprecationsCollector/src';
  load.
```

## How to depend on it?

If you want to add a dependency on `PharoDeprecationsCollector` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'PharoDeprecationsCollector'
  with: [ spec repository: 'github://olekscode/PharoDeprecationsCollector/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?
