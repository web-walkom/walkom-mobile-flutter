package ru.walkom.walkom_mobile_flutter

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        //MapKitFactory.setLocale("YOUR_LOCALE")
        MapKitFactory.setApiKey("4e10e9f2-d783-499c-b77d-8fc64489b4ac")
        super.configureFlutterEngine(flutterEngine)
    }
}
