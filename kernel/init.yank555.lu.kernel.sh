#!/system/bin/sh
#--------------------------------------------------
# Yank555.lu - generated kernel options init script
#--------------------------------------------------

log_file="/data/kernel-boot.log"

echo "----------------------------------------------------" >$log_file
echo "Yank555.lu - execution of kernel options init script" >>$log_file
echo "----------------------------------------------------" >>$log_file
echo "Kernel version : `uname -a`" >>$log_file
echo "Busybox used   : `which busybox`" >>$log_file

echo `date +"%F %R:%S : Checking for Yank555.lu kernel..."` >>$log_file

if [ "`uname -r | grep Yank555.lu`" == "" ]
  then
    echo `date +"%F %R:%S : No Yank555.lu kernel found, skip executing the config file"` >>$log_file
    exit
fi;

echo `date +"%F %R:%S : Yank555.lu kernel found, continue executing the config file..."` >>$log_file

echo `date +"%F %R:%S : Waiting for Android to start..."` >>$log_file

# Wait until we see some android processes to consider boot is more or less complete (credits to AndiP71)
while ! pgrep com.android ; do
  sleep 1
done

echo `date +"%F %R:%S : Android is starting up, let's wait another 10 seconds..."` >>$log_file

# Now that is checked, let's just wait another tiny little bit
sleep 30

echo `date +"%F %R:%S : Starting kernel configuration..."` >>$log_file

#----------------------------------------------------

# - SELinux Enforcine
setenforce 1
echo `date +"%F %R:%S : SELinux set to enforcing."` >>$log_file

# - init.d support by kernel/ramdisk not installed
echo `date +"%F %R:%S : Init.d script execution support disabled."` >>$log_file
ls -al /system/etc/init.d >>$log_file

# Set Simple GPU algorithm (faux123)
echo 1 > /sys/module/simple_gpu_algorithm/parameters/simple_gpu_activate
echo `date +"%F %R:%S : Simple GPU algorithm set to enabled."` >>$log_file

# Set Simple GPU algorithm laziness (faux123)
echo 0 > /sys/module/simple_gpu_algorithm/parameters/simple_laziness
echo `date +"%F %R:%S : Simple GPU algorithm laziness set to 0."` >>$log_file

# Set Simple GPU algorithm ramp down threshold (faux123)
echo 0 > /sys/module/simple_gpu_algorithm/parameters/simple_ramp_threshold
echo `date +"%F %R:%S : Simple GPU algorithm ramp down threshold set to 0."` >>$log_file

# Set Userspace DVFS access to ignore
#echo 1 > /sys/kernel/cpufreq_hardlimit/userspace_dvfs_lock
#echo `date +"%F %R:%S : Userspace DVFS access set to ignore."` >>$log_file
# Set Userspace DVFS access to enabled
echo 0 > /sys/kernel/cpufreq_hardlimit/userspace_dvfs_lock
echo `date +"%F %R:%S : Userspace DVFS access set to enabled."` >>$log_file
 
# Set CPU Governor
echo "intellimm" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu1/online
echo "intellimm" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu2/online
echo "intellimm" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu3/online
echo "intellimm" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo `date +"%F %R:%S : CPU governor set to intellimm."` >>$log_file
 
# Set CPU min. wakeup kick frequency
echo 300000 > /sys/kernel/cpufreq_hardlimit/scaling_min_freq_screen_on
echo `date +"%F %R:%S : CPU min. screen on frequency hardlimit set to 0.30GHz."` >>$log_file
 
# Set CPU min. wakeup kick frequency
echo 300000 > /sys/kernel/cpufreq_hardlimit/scaling_min_freq_screen_off
echo `date +"%F %R:%S : CPU min. screen off frequency hardlimit set to 0.30GHz."` >>$log_file
 
# Set CPU max. frequency hardlimit
#echo 2265600 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_on
#echo `date +"%F %R:%S : CPU max. screen on frequency hardlimit set to 2.27GHz (stock)."` >>$log_file
echo 2496000 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_on
echo `date +"%F %R:%S : CPU max. screen on frequency hardlimit set to 2.50GHz (OC)."` >>$log_file
 
# Set CPU max. frequency screen off hardlimit
echo 1267200 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_off
echo `date +"%F %R:%S : CPU max. screen off frequency hardlimit set to 1.27GHz."` >>$log_file
 
# Set CPU min. wakeup kick frequency
echo 1958400 > /sys/kernel/cpufreq_hardlimit/wakeup_kick_freq
echo `date +"%F %R:%S : CPU min. wakeup kick frequency set to 1.96GHz."` >>$log_file
 
# Set CPU min. wakeup kick delay
echo 3000 > /sys/kernel/cpufreq_hardlimit/wakeup_kick_delay
echo `date +"%F %R:%S : CPU min. wakeup kick delay set to 3 seconds."` >>$log_file
 
# Set CPU touchboost low frequency
echo 652800 > /sys/kernel/cpufreq_hardlimit/touchboost_lo_freq
echo `date +"%F %R:%S : CPU min. touchboost low frequency set to 0.65GHz."` >>$log_file
 
# Set CPU touchboost high frequency
echo 1036800 > /sys/kernel/cpufreq_hardlimit/touchboost_hi_freq
echo `date +"%F %R:%S : CPU min. touchboost high frequency set to 1.04GHz."` >>$log_file
 
# Intelliplug & Intellithermal not yet added
# Set CPU Hotplug driver
#stop mpdecision
#echo 1 > /sys/module/intelli_plug/parameters/intelli_plug_active
#echo 0 > /sys/module/intelli_plug/parameters/touch_boost_active
#echo `date +"%F %R:%S : CPU Hotplug driver set to IntelliPlug."` >>$log_file
# 
# Set CPU Hotplug driver
#echo 2 > /sys/module/intelli_plug/parameters/nr_run_profile_sel
#echo `date +"%F %R:%S : IntelliPlug Profile set to Conservative."` >>$log_file
# 
# Set CPU Hotplug driver
#echo 8 > /sys/module/intelli_plug/parameters/nr_run_hysteresis
#echo `date +"%F %R:%S : IntelliPlug Hysteresis set to average (8)."` >>$log_file
# 
# Set CPU Hotplug driver
#echo 2000 > /sys/module/intelli_plug/parameters/cpu_nr_run_threshold
#echo `date +"%F %R:%S : IntelliPlug Runqueue Threshold set to calm (2000)."` >>$log_file
# 
# Set CPU Thermal driver
#stop thermal-engine
#echo 1 > /sys/module/msm_thermal/parameters/enabled
#echo 12 > /sys/module/msm_thermal/parameters/core_control_mask
#echo 15 > /sys/module/msm_thermal/parameters/freq_control_mask
#echo `date +"%F %R:%S : CPU Thermal driver set to IntelliThermal."` >>$log_file
# 
# Set CPU Thermal driver
#echo 70 > /sys/module/msm_thermal/parameters/limit_temp_degC
#echo `date +"%F %R:%S : IntelliThermal Frequency Throttle limit set to 80 degrees."` >>$log_file
# 
# Set CPU Thermal driver
#echo 75 > /sys/module/msm_thermal/parameters/core_limit_temp_degC
#echo `date +"%F %R:%S : IntelliThermal Core Throttle limit set to 85 degrees."` >>$log_file
 
# - zSwap activation - 1024Mb
if [ -e /sys/block/vnswap0/disksize ] ; then

  swapoff /dev/block/vnswap0

  echo 1073741824 > /sys/block/vnswap0/disksize

  mkswap /dev/block/vnswap0

  swapon /dev/block/vnswap0
  
fi
echo `date +"%F %R:%S : 1024Mb zSwap support enabled."` >>$log_file

# - swappiness set to 80
echo 80 > /proc/sys/vm/swappiness;
echo `date +"%F %R:%S : Swappiness set to 80."` >>$log_file

# - Enable custom current forced fast charge
echo 2 > /sys/kernel/fast_charge/force_fast_charge
echo `date +"%F %R:%S : Fast Charge - Custom Current Mode enabled."` >>$log_file
echo 1000 > /sys/kernel/fast_charge/usb_charge_level
echo `date +"%F %R:%S : Fast Charge - USB charge level set to 1000mA/h."` >>$log_file
echo 650 > /sys/kernel/fast_charge/wireless_charge_level
echo `date +"%F %R:%S : Fast Charge - WIRELESS charge level set to 650mA/h."` >>$log_file
echo 1800 > /sys/kernel/fast_charge/ac_charge_level
echo `date +"%F %R:%S : Fast Charge - AC charge level set to 1800mA/h."` >>$log_file

# - Enable notification LED with very high intensity
echo 192 > /sys/class/sec/led/led_intensity
echo `date +"%F %R:%S : Notification LED set to very high intensity."` >>$log_file

# - Enable notification LED on at 3x speed
echo 3 > /sys/class/sec/led/led_speed_on
echo `date +"%F %R:%S : Notification LED on set to 3x shorter."` >>$log_file

# - Enable notification LED off at normal speed
echo 1 > /sys/class/sec/led/led_speed_off
echo `date +"%F %R:%S : Notification LED off set to normal shorter."` >>$log_file

# - Enable touch wake for 20 second
echo 1 > /sys/class/misc/touchwake/enabled
echo `date +"%F %R:%S : Touch Wake enabled."` >>$log_file

echo 20000 > /sys/class/misc/touchwake/delay
echo `date +"%F %R:%S : Touch Wake delay set to 20 seconds."` >>$log_file

# Wait for everything to become ready
echo `date +"%F %R:%S : Waiting 60 seconds..."` >>$log_file
sleep 60
# Internal MMC readahead buffer size
echo 512 > /sys/block/mmcblk0/bdi/read_ahead_kb
echo `date +"%F %R:%S : Internal MMC Readahead set to 512Kb."` >>$log_file

# Internal MMC I/O scheduler
echo "fiops" > /sys/block/mmcblk0/queue/scheduler
echo `date +"%F %R:%S : Internal MMC scheduler set to FIOPS."` >>$log_file

# SD card readahead buffer size
echo 1024 > /sys/block/mmcblk1/bdi/read_ahead_kb
echo `date +"%F %R:%S : External MMC Readahead set to 1024Kb."` >>$log_file

# SD card I/O scheduler
echo "cfq" > /sys/block/mmcblk1/queue/scheduler
echo `date +"%F %R:%S : External MMC scheduler set to CFQ."` >>$log_file

# - Enable dynamic deferred file sync (by faux123)
#     While screen is on, file sync is temporarily deferred, when screen
#     is turned off, a flush is called to synchronize all outstanding writes.
#     Turn on powersuspend before starting to use dynamic fsync !
echo 1 > /sys/kernel/dyn_fsync/Dyn_fsync_active
echo `date +"%F %R:%S : Dynamic Deferred File Sync enabled."` >>$log_file

# - Set "Standard" MDNIE settings to Yank Movie

echo 1 > /sys/devices/virtual/mdnie/mdnie/hijack

# Copy Movie mode
echo 3 > /sys/devices/virtual/mdnie/mdnie/copy_mode

# Use Dynamic curve
echo 0 > /sys/devices/virtual/mdnie/mdnie/curve

echo 1 > /sys/devices/virtual/mdnie/mdnie/sharpen

#echo 255 > /sys/devices/virtual/mdnie/mdnie/red_red
#echo 0   > /sys/devices/virtual/mdnie/mdnie/red_green
#echo 0   > /sys/devices/virtual/mdnie/mdnie/red_blue

#echo 0   > /sys/devices/virtual/mdnie/mdnie/green_red
#echo 255 > /sys/devices/virtual/mdnie/mdnie/green_green
#echo 0   > /sys/devices/virtual/mdnie/mdnie/green_blue

#echo 0   > /sys/devices/virtual/mdnie/mdnie/blue_red
#echo 0   > /sys/devices/virtual/mdnie/mdnie/blue_green
#echo 255 > /sys/devices/virtual/mdnie/mdnie/blue_blue

#echo 0   > /sys/devices/virtual/mdnie/mdnie/cyan_red
#echo 255 > /sys/devices/virtual/mdnie/mdnie/cyan_green
#echo 255 > /sys/devices/virtual/mdnie/mdnie/cyan_blue

#echo 255 > /sys/devices/virtual/mdnie/mdnie/magenta_red
#echo 0   > /sys/devices/virtual/mdnie/mdnie/magenta_green
#echo 255 > /sys/devices/virtual/mdnie/mdnie/magenta_blue

#echo 255 > /sys/devices/virtual/mdnie/mdnie/yellow_red
#echo 255 > /sys/devices/virtual/mdnie/mdnie/yellow_green
#echo 0   > /sys/devices/virtual/mdnie/mdnie/yellow_blue

echo 255 > /sys/devices/virtual/mdnie/mdnie/white_red
echo 255 > /sys/devices/virtual/mdnie/mdnie/white_green
echo 255 > /sys/devices/virtual/mdnie/mdnie/white_blue

#echo 0 > /sys/devices/virtual/mdnie/mdnie/black_red
#echo 0 > /sys/devices/virtual/mdnie/mdnie/black_green
#echo 0 > /sys/devices/virtual/mdnie/mdnie/black_blue

echo 1 > /sys/devices/virtual/mdnie/mdnie/mode

echo `date +"%F %R:%S : Standard MDNIE set to Yank Movie."` >>$log_file

echo `date +"%F %R:%S : Finished kernel configuration."` >>$log_file

chmod 644 $log_file

#--------------------------------------------------
# End of generated script
#--------------------------------------------------
