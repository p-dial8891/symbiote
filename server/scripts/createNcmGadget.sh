echo 0x1d6b > idVendor      # Linux Foundation's Vendor ID
echo 0x0104 > idProduct     # Product ID for NCM Gadget
echo 0x0100 > bcdDevice     # Device release number 1.0
echo 0x0200 > bcdUSB        # USB 2.0 specification compliance

mkdir strings/0x409
echo "0123456789" > strings/0x409/serialnumber
echo "MyManufacturer" > strings/0x409/manufacturer
echo "MyNCMDevice" > strings/0x409/product

mkdir configs/c.1
mkdir configs/c.1/strings/0x409
echo "Config 1: NCM" > configs/c.1/strings/0x409/configuration
echo 120 > configs/c.1/MaxPower  # Maximum power consumption in mA

mkdir functions/ncm.usb0
ln -s functions/ncm.usb0 configs/c.1/

