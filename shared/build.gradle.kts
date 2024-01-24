import co.touchlab.skie.configuration.EnumInterop
import co.touchlab.skie.configuration.SealedInterop

plugins {
    alias(libs.plugins.kotlin.multiplatform)
    alias(libs.plugins.cocoapods)
    alias(libs.plugins.skie)
}

kotlin {
    iosX64()
    iosArm64()
    iosSimulatorArm64()

    sourceSets {
        commonMain {
            dependencies {
                implementation(libs.kotlinx.coroutines.core)
                implementation(libs.skie.annotations)
            }
        }
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
