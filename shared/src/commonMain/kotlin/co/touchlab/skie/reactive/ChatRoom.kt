package co.touchlab.skie.reactive

import co.touchlab.skie.configuration.annotations.SuspendInterop
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlin.time.Duration.Companion.seconds

class ChatRoom {
    private val _messages = MutableStateFlow(emptyList<String>())
    val messages: StateFlow<List<String>> = _messages

    @Suppress("MemberVisibilityCanBePrivate")
    suspend fun send(message: String) {
        delay(1.seconds)

        _messages.value += message
    }

    @SuspendInterop.Disabled
    suspend fun sendWithoutSKIE(message: String) {
        send(message)
    }
}
