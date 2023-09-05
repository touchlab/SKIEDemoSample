package co.touchlab.skie.types

sealed class OperationType {
    data class Unknown(val message: String) : OperationType()
    object Plus : OperationType()
    object Minus : OperationType()
    object Divide : OperationType()
    object Multiply : OperationType()
    object Clear : OperationType()
    object Delete : OperationType()
    object Equals : OperationType()
}

fun lookupOperationType(
    value: String,
    defaultValue: OperationType = OperationType.Unknown("Oops")
) = when (value) {
    "+" -> OperationType.Plus
    "-" -> OperationType.Minus
    "/" -> OperationType.Divide
    "*" -> OperationType.Multiply
    "C" -> OperationType.Clear
    "<" -> OperationType.Delete
    "=" -> OperationType.Equals
    else -> defaultValue
}
