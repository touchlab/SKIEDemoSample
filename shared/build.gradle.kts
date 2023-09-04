import co.touchlab.skie.configuration.EnumInterop
import co.touchlab.skie.configuration.SealedInterop

plugins {
    kotlin("multiplatform")
    kotlin("native.cocoapods")
    id("co.touchlab.skie") version libs.versions.skie.get()
}

kotlin {
    ios()
    iosSimulatorArm64()

    val commonMain by sourceSets.getting {
        dependencies {
            implementation(libs.kotlinx.coroutines.core)
            implementation(libs.skie.annotations)
        }
    }

    val iosMain by sourceSets.getting
    val iosTest by sourceSets.getting

    val iosSimulatorArm64Main by sourceSets.getting {
        dependsOn(iosMain)
    }
    val iosSimulatorArm64Test by sourceSets.getting {
        dependsOn(iosTest)
    }

    cocoapods {
        summary = "SKIE Demo Project"
        homepage = "https://github.com/touchlab/SKIEDemo"
        ios.deploymentTarget = "14"
    }
}

skie {
    features {
        group("co.touchlab.skie.types") {
            SealedInterop.Enabled(false)
            EnumInterop.Enabled(false)
        }
    }
}

version = "1.2"
