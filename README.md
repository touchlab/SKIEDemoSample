# SKIE Demo

This project is a demo app to show off the various features of [SKIE - Swift Kotlin Interface Enhancer](https://skie.touchlab.co/).

## [SKIE Demo Article](https://touchlab.co/skie-demo)


To understand this project, you need to read the [SKIE Demo Article](https://touchlab.co/skie-demo).

## (Quick) SKIE Overview

SKIE is a tool for Kotlin Multiplatform that augments the inteface published from Kotlin to Swift. It allows various language features of Kotlin to be used from Swift.

* Type Augmentation
  * Enums (exhaustive)
  * Sealed Classes (exhaustive)
  * Default Arguments
* Coroutines Interop
  * Suspend functions (cancellable, can use from any thread)
  * Flow (as AsyncSequence. Bi-directional lifecycle management)

## App Screens

There are 3 main screens in the app:

### Calculator

Basic calculator. Used to show the type augmentation features of SKIE.

### Tick Counter

Very simple screen with a `Flow` backing the UI. Demonstrates the basics of SKIE `Flow` support.

### Solo Chat

A mock chat application. Shows suspend functions and `StateFlow` being used from Swift.