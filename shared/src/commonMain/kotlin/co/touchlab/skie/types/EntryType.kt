package co.touchlab.skie.types

enum class EntryType {
    NUMERIC, OPERATION
}

fun lookupEntryType(value: String) = when (value) {
    in "0".."9" -> EntryType.NUMERIC
    "." -> EntryType.NUMERIC
    else -> EntryType.OPERATION
}