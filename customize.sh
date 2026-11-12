#!/system/bin/sh
# Dibuat oleh ThRE Team

# Deteksi bahasa sistem
LOCALE=$(getprop persist.sys.locale)
[ -z "$LOCALE" ] && LOCALE=$(getprop ro.product.locale)

case "$LOCALE" in
    in*|id*)
        IS_ID=1
        ;;
    *)
        IS_ID=0
        ;;
esac

ui_print "****************************************"
ui_print " Set Anim 0.5x     "
ui_print "  By: ThRE Team                         "
ui_print "****************************************"

if [ "$IS_ID" -eq 1 ]; then
    ui_print "- Mengatur izin skrip eksekusi..."
else
    ui_print "- Setting script execution permissions..."
fi

set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/action.sh 0 0 0755

if [ "$IS_ID" -eq 1 ]; then
    ui_print "- Menerapkan skala animasi 0.5x secara instan..."
else
    ui_print "- Applying 0.5x animation scale immediately..."
fi

settings put global window_animation_scale 0.5
settings put global transition_animation_scale 0.5
settings put global animator_duration_scale 0.5

if [ "$IS_ID" -eq 1 ]; then
    ui_print "- Selesai! Animasi langsung aktif di 0.5x (tanpa perlu reboot)."
else
    ui_print "- Done! 0.5x animation scale is active immediately (no reboot needed)."
fi
