# Symbiote
A portable storage device for personally identifiable information (PII)

## Introduction
There is a lot of information that is inherent to a person's identity, particularly online. This info is very commonly stored on personal devices like smartphones. However, the smartphone has become a general-purpose device with many uses that are not very portable. To be more precise, the device is portable but the information is not. A special-purpose device is needed that meets the needs of a secure form of storage that can retrieve the user's identifiable info and allow it to be used in the many computer interfaces that are common now.

What if there was a device that could be plugged into any computer turning the computer into a thin client for the device? User's PII can be kept on the device and the interchange of information can be done seamlessly with the applications on the thin client. A sort of symbiote device. This is possible now with the availability of portable single-board computers with connectivity options like USB, Bluetooth, WiFi, and more.

## Specifications
The device shall have the following hardware components
1. Display to show prompts
2. Joystick and buttons to accept input
3. Microprocessor running a Linux distro
4. USB device controller
5. Inbuilt storage

The software components will include
1. A USB Composite device with the following interfaces
   - USB HID Keyboard
   - USB NCM Network Adapter
   - USB Mass Storage Class device
2. An X11 server for windows with X11 Forwarding
3. The Mobius password manager (more details below)
4. A PDF Reader with image and text annotation capabilities
5. A Graphics package suitable for creating eSignatures by a pointing device
6. Shell scripts that will be used by the user to
   - Start the mobius password manager
   - Start the graphics package to create eSignatures
7. Linux distribution with package management

