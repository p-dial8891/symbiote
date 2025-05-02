echo 0x1d6b > idVendor  # Linux Foundation VID
echo 0x0104 > idProduct # Mass Storage Gadget PID
echo 0x0100 > bcdDevice
echo 0x0200 > bcdUSB

mkdir -p strings/0x409
echo "0123456789" > strings/0x409/serialnumber
echo "Raspberry Pi" > strings/0x409/manufacturer
echo "USB Mass Storage" > strings/0x409/product

mkdir -p configs/c.1/strings/0x409
echo "Mass Storage" > configs/c.1/strings/0x409/configuration
echo 120 > configs/c.1/MaxPower

mkdir -p functions/mass_storage.usb2
#echo 0 > functions/mass_storage.usb1/stall
echo /dev/mmcblk0p3 > functions/mass_storage.usb2/lun.0/file  # Use the backing file
echo 1 > functions/mass_storage.usb2/lun.0/removable
echo 0 > functions/mass_storage.usb2/lun.0/ro
ln -s functions/mass_storage.usb2 configs/c.1/

