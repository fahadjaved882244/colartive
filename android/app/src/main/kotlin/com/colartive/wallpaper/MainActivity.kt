package com.colartive.async

import android.app.WallpaperManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.DisplayMetrics
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import androidx.core.graphics.scale

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.colartive.wallpapers/wallpaper"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "setHomeScreenWallpaper" -> {
                    val imagePath = call.argument<String>("imagePath")
                    if (imagePath != null) {
                        setHomeScreenWallpaper(imagePath, result)
                    } else {
                        result.error("INVALID_ARGUMENT", "Image path is required", null)
                    }
                }
                "setLockScreenWallpaper" -> {
                    val imagePath = call.argument<String>("imagePath")
                    if (imagePath != null) {
                        setLockScreenWallpaper(imagePath, result)
                    } else {
                        result.error("INVALID_ARGUMENT", "Image path is required", null)
                    }
                }
                "setBothWallpapers" -> {
                    val imagePath = call.argument<String>("imagePath")
                    if (imagePath != null) {
                        setBothWallpapers(imagePath, result)
                    } else {
                        result.error("INVALID_ARGUMENT", "Image path is required", null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun setHomeScreenWallpaper(imagePath: String, result: MethodChannel.Result) {
        try {
            val wallpaperManager = WallpaperManager.getInstance(this)
            val imageFile = File(imagePath)

            if (!imageFile.exists()) {
                result.error("FILE_NOT_FOUND", "Image file not found at path: $imagePath", null)
                return
            }

            val bitmap2 = BitmapFactory.decodeFile(imagePath)
            if (bitmap2 == null) {
                result.error("INVALID_IMAGE", "Unable to decode image file", null)
                return
            }

            val metrics = DisplayMetrics()
            windowManager.defaultDisplay.getRealMetrics(metrics)
            val height = metrics.heightPixels
            val width = metrics.widthPixels
            val bitmap = bitmap2.scale(width, height)

            wallpaperManager.setBitmap(bitmap, null, false, WallpaperManager.FLAG_SYSTEM)

            result.success("Home screen wallpaper set successfully")
        } catch (e: Exception) {
            result.error("SET_WALLPAPER_ERROR", "Failed to set home screen wallpaper: ${e.message}", null)
        }
    }

    private fun setLockScreenWallpaper(imagePath: String, result: MethodChannel.Result) {
        try {
            val wallpaperManager = WallpaperManager.getInstance(this)
            val imageFile = File(imagePath)

            if (!imageFile.exists()) {
                result.error("FILE_NOT_FOUND", "Image file not found at path: $imagePath", null)
                return
            }

            val bitmap2 = BitmapFactory.decodeFile(imagePath)
            if (bitmap2 == null) {
                result.error("INVALID_IMAGE", "Unable to decode image file", null)
                return
            }

            val metrics = DisplayMetrics()
            windowManager.defaultDisplay.getRealMetrics(metrics)
            val height = metrics.heightPixels
            val width = metrics.widthPixels
            val bitmap = bitmap2.scale(width, height)

            wallpaperManager.setBitmap(bitmap, null, false, WallpaperManager.FLAG_LOCK)
            result.success("Lock screen wallpaper set successfully")
        } catch (e: Exception) {
            result.error("SET_WALLPAPER_ERROR", "Failed to set lock screen wallpaper: ${e.message}", null)
        }
    }

    private fun setBothWallpapers(imagePath: String, result: MethodChannel.Result) {
        try {
            val wallpaperManager = WallpaperManager.getInstance(this)
            val imageFile = File(imagePath)

            if (!imageFile.exists()) {
                result.error("FILE_NOT_FOUND", "Image file not found at path: $imagePath", null)
                return
            }

            val bitmap2 = BitmapFactory.decodeFile(imagePath)
            if (bitmap2 == null) {
                result.error("INVALID_IMAGE", "Unable to decode image file", null)
                return
            }

            val metrics = DisplayMetrics()
            windowManager.defaultDisplay.getRealMetrics(metrics)
            val height = metrics.heightPixels
            val width = metrics.widthPixels
            val bitmap = bitmap2.scale(width, height)

            wallpaperManager.setBitmap(bitmap, null, false, WallpaperManager.FLAG_SYSTEM or WallpaperManager.FLAG_LOCK)

            result.success("Both wallpapers set successfully")
        } catch (e: Exception) {
            result.error("SET_WALLPAPER_ERROR", "Failed to set wallpapers: ${e.message}", null)
        }
    }
}