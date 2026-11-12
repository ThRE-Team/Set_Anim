#!/system/bin/sh
# Dibuat oleh ThRE Team
MODDIR=${0%/*}

# Tunggu hingga sistem selesai booting agar perintah settings tidak gagal
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 2
done

# Jeda tambahan 3 detik untuk memastikan service settings siap
sleep 3

# Atur skala animasi ke 0.5x
settings put global window_animation_scale 0.5
settings put global transition_animation_scale 0.5
settings put global animator_duration_scale 0.5
