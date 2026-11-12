#!/system/bin/sh
# Dibuat oleh ThRE Team
MODDIR=${0%/*}

# Deteksi bahasa sistem (persist.sys.locale atau ro.product.locale)
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

WIN=$(settings get global window_animation_scale)
TRANS=$(settings get global transition_animation_scale)
ANIM=$(settings get global animator_duration_scale)

echo "=========================================="
if [ "$IS_ID" -eq 1 ]; then
    echo "   CEK STATUS ANIMASI   "
else
    echo "   ANIMATION STATUS    "
fi
echo "=========================================="
echo ""
echo "- Window Animation Scale     : $WIN"
echo "- Transition Animation Scale : $TRANS"
echo "- Animator Duration Scale    : $ANIM"
echo ""

if [ "$WIN" = "0.5" ] && [ "$TRANS" = "0.5" ] && [ "$ANIM" = "0.5" ]; then
    if [ "$IS_ID" -eq 1 ]; then
        echo "Status: [AKTIF] Semua animasi sudah 0.5x!"
    else
        echo "Status: [ACTIVE] All animations are set to 0.5x!"
    fi
else
    if [ "$IS_ID" -eq 1 ]; then
        echo "Status: [BELUM 0.5x] Menerapkan ulang ke 0.5x..."
    else
        echo "Status: [NOT 0.5x] Re-applying 0.5x scale..."
    fi
    settings put global window_animation_scale 0.5
    settings put global transition_animation_scale 0.5
    settings put global animator_duration_scale 0.5
    if [ "$IS_ID" -eq 1 ]; then
        echo "Selesai! Skala animasi sudah diatur ke 0.5x."
    else
        echo "Done! Animation scale has been set to 0.5x."
    fi
fi

echo "=========================================="
