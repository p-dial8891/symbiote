# variables and strings
MANUFACTURER="Some Company"                                       #  manufacturer attribute
SERIAL="Frosted Flakes"                                           #  device serial number
IDPRODUCT="0xa4ac"                                                #  hex product ID, issued by USB Group
IDVENDOR="0x0525"                                                 #  hex vendor ID, assigned by USB Group
PRODUCT="Emulated HID Keyboard"                                   #  cleartext product description
CONFIG_NAME="Configuration 1"                                     #  name of this configuration
MAX_POWER_MA=120                                                  #  max power this configuration can consume in mA
PROTOCOL=1                                                        #  1 for keyboard. see usb spec
SUBCLASS=1                                                        #  it seems either 1 or 0 works, dunno why
REPORT_LENGTH=8                                                   #  number of bytes per report
DESCRIPTOR=/home/Developer/keyboard-gadget/kybd-descriptor.bin  #  binary blob of report descriptor, see HID class spec
UDC=$(ls /sys/class/udc/)                                                     #  name of the UDC driver to use (found in /sys/class/udc/)   

# gadget configuration
mkdir functions/hid.usb1                                         #  add hid function (will fail if kernel < 3.19, which hid was added in)
echo $PROTOCOL > functions/hid.usb1/protocol                      #  set the HID protocol
echo $SUBCLASS > functions/hid.usb1/subclass                      #  set the device subclass
echo $REPORT_LENGTH > functions/hid.usb1/report_length            #  set the byte length of HID reports
cat $DESCRIPTOR > functions/hid.usb1/report_desc                  #  write the binary blob of the report descriptor to report_desc; see HID class spec
mkdir strings/0x409                                               #  setup standard device attribute strings
mkdir configs/c.1/strings/0x409
ln -s functions/hid.usb1 configs/c.1                              #  put the function into the configuration by creating a symlink

# binding
#echo $UDC > UDC                                                   #  bind gadget to UDC driver (brings gadget online). This will only
                                                                  #  succeed if there are no gadgets already bound to the driver. Do
                                                                  #  lsmod and if there's anything in there like g_*, you'll need to
                                                                  #  rmmod it before bringing this gadget online. Otherwise you'll get
                                                                  #  "device or resource busy."
