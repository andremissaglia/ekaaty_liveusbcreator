��    5      �              l     m  �   t  h   j     �     �  (   �     !  $   1      V     w     �     �     �  S   �  �     &   �     �     �     �  Z        ]  J   v      �     �     �  6        N     k  �   {     	  }   	  �   �	  �   K
  w   <  a   �  >        U     r  $   �     �  $   �  C   �     9     M  Y   h     �  !   �     �  I     )   [  Q   �     �  0  �       �     ^   �     -     C  '   R     z     �     �     �     �     �     �  G     o   N  )   �     �            M   ,     z  ?   �  !   �     �       <   #      `     �  �   �     $  `   1  �   �  �     i   �  B   /  9   r     �      �  !   �           '  H   H     �     �  Q   �       )   +     U  E   q  !   �  M   �     '   Browse By allocating extra space on your USB stick for a persistent overlay, you will be able to store data and make permanent modifications to your live operating system.  Without it, you will not be able to save data that will persist after a reboot. Cannot find '%s'.  Make sure to extract the entire liveusb-creator zip file before running this program. Cannot find device %s Complete! (%s) Configuring and installing bootloader... Create Live USB Creating %d Mb persistent overlay... Creating %sMB persistent overlay Download Fedora Download complete! Download failed:  Downloading %s... Error: Cannot set the label or obtain the UUID of your device.  Unable to continue. Error: The SHA1 of your Live CD is invalid.  You can run this program with the --noverify argument to bypass this verification check. Extracting live image to USB device... Fedora LiveUSB Creator Filesystem for %s unknown! ISO selected: %s If you do not select an existing Live CD, the selected release will be downloaded for you. LiveUSB creation failed! Make sure your USB key is plugged in and formatted with the FAT filesystem Not enough free space on device. Persistent Storage (%d Mb) Persistent Storage (0 Mb) Press 'Create Live USB' again if you wish to continue. Removing existing Live OS... Select Live ISO Sorry, I'm having trouble encoding the filename of your livecd.  You may have better luck if you move your ISO to the root of your drive (ie: C:\) Target Device There was a problem executing the following command: `%s`
A more detailed error log has been written to 'liveusb-creator.log' This button allows you to browse for an existing Live CD ISO that you have previously downloaded.  If you do not select one, a release will be downloaded for you automatically. This button will begin the LiveUSB creation process.  This entails optionally downloading a release (if an existing one wasn't selected),  extracting the ISO to the USB device, creating the persistent overlay, and installing the bootloader. This is the USB stick that you want to install your Live CD on.  This device must be formatted with the FAT filesystem. This is the progress bar that will indicate how far along in the LiveUSB creation process you are This is the status console, where all messages get written to. Unable to find LiveOS on ISO Unable to find any USB drives Unable to find any removable devices Unable to mount device: %s Unable to remove previous LiveOS: %s Unknown filesystem for %s.  Your device may need to be reformatted. Unknown release: %s Unsupported filesystem: %s Unsupported filesystem: %s
Please backup and format your USB key with the FAT filesystem. Use existing Live CD Verifying SHA1 of LiveCD image... Verifying filesystem... Warning: Creating a new persistent overlay will delete your existing one. You can try again to resume your download Your device already contains a LiveOS.
If you continue, this will be overwritten. or Project-Id-Version: liveusb-creator
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2008-09-03 02:54-0400
PO-Revision-Date: 2009-10-07 15:56+0800
Last-Translator: 甘露(Gan Lu) <rhythm.gan@gmail.com>
Language-Team:  <>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 浏览 通过为持久覆盖分配你U盘上的额外空间，你将能够存放数据并对你的 live 操作系统进行永久的修改。没有它，你将无法在重启动后存放数据。 找不到“%s”。请确认在运行本程序前解压整个 liveusb-creator 压缩文件。 无法找到设备 %s 搞定！ (%s) 正在配置和安装启动加载器... 创建 Live USB Creating %d Mb 持久覆盖 正在创建 %sMB 持久覆盖 下载 Fedora 下载完成！ 下载失败！ 正在下载 %s... 错误：无法设定标签或获得你设备的 UUID。不能继续。 错误：你 Live CD 的 SHA1 值不符。你能够使用 --noverify 参数运行本程序来避开该验证。 正在解压 live 映像到 USB 设备... Fedora LiveUSB 创建者  %s 的文件系统未知！ 已选定: %s 如果你不选择某现存的 Live CD，将为你下载你选定的发行。 LiveUSB 创建失败！ 请确认你的U盘已插入并已用 FAT 文件系统格式化 设备上无足够空余空间。 持久存储器 (%d Mb) 持久存储器 (0 Mb) 再次按下“创建 Live USB”，如果你希望继续。 正在删除现存的 Live OS... 选择 Live ISO 抱歉，编码你 livecd 的文件名时有点问题。如果你把你的 ISO 放到你驱动盘的根目录 (比如： C:\)，可能会好点。 目标设备 执行下列命令时出现问题：`%s`
更详细的错误日志已写入 'liveusb-creator.log' 该按钮允许你浏览某个你之前已下载的 Live CD ISO。如果你不选择一个，将自动为你下载某次发行。 该按钮将开始 LiveUSB 创建过程。可选择的使其下载某次发行(如果没有选定某现存)，解压 ISO 到U盘，建立持久覆盖并安装启动加载器。 这是你希望安装 Live CD 到其之上的U盘。该设备必须用 FAT 文件系统进行格式化。 这是进度条，指示 LiveUSB 创建过程已进行到多远。 这是状态控制台，所有信息都将写入此处。 无法在 ISO 中找到 LiveOS  无法找到任何 USB 驱动盘 无法找到任何可移动设备 无法挂载设备：%s 无法删除以前的 LiveOS: %s %s 为未知的文件系统。你的设备也许需要重新格式化。 未知发行：%s 不支持的文件系统：%s 不支持的文件系统：%s
请备份并用 FAT 文件系统格式化你的U盘 使用现存的 Live CD 正在验证 LiveCD 映像的 SHA1 值... 正在验证文件系统... 警告：创建一个新的持久覆盖将删除你现存的这个。 你可以重试续传你的下载 你的设备已经包含一个 LiveOS。
如果你继续，它将被覆盖。 或 