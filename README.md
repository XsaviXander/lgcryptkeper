# lgcryptkeper
This one modified file bypasses the forced "encryption unsuccessful" screen when formatted with TWRP.

Just decompile your lgsettings.apk with the lge-res.apk installed as framework file with APK easy tool and drop it in "smali/com/android/settings". Overwrite it.

This was taken from the LG V40 stock US pie LGSettings.apk. Though, it should work with all V40 Pie firmware. I have to do some Diff checking though.
