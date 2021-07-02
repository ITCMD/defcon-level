# Defcon Level (Version 2)
# Defcon-Warning-System Level Detection Tool (bat/jscript/vbscript tool)

![](https://i.imgur.com/EjNVdGJ.png)

######   More Screenshots below!

  This Program is designed for use with the unofficial Defcon Warning System (https://defconwarningsystem.com/ ). It queries the status and freaks the heck out if it goes down to Defcon One.

​    It is designed to be run minimized on startup. It was created in reaction to some possible malware in the Defcon Warning System's executables, which is not open source. These concerns were resolved, however this remains as an open source and lighter alternative.

​	**New:** As of version 1.7, you can add a file called `DontDisplayOnStartup.config` in the program's main directory, and the program will not display the current defcon level on startup unless it is below 5.

#### <u>**How it Works:**</u>

​    This program queries the defconwarningsystem.com's Defcon level using [winhttpjs](https://github.com/npocmaka/batch.scripts/blob/master/hybrids/jscript/winhttpjs.bat), and reacts depending on the level with an alert sound, and an update on screen. If the level goes down to one, it will turn up the volume using [jscript](https://stackoverflow.com/a/22895700/7872447) (to make sure you hear the alert) and play the alert until you close the program. It will also read the Defcon status out loud for both Defcon two and one. As of the latest update it runs in the background. It makes sure duplicate windows do not exist using [CMDS](https://github.com/ITCMD/CMDS). In order to have it run on startup you will have to follow the instructions below in Installation.

​	**Users can also run custom commands at any level** by editing the code and changing the variables at the beginning of the script from rem to anything else. It is recommended you use this space to start a program that performs your wanted actions. This way, if they fail, it will not damage this script. **The script now also checks for updates automatically, but will not install them automatically for security.**

   Users may also run the GUI portion of the program individually. The program will check the current defcon status, as well as tell the user if the background service is running or not.


#### <u>Known Issues:</u>

   None as of now, I fixed them all! Let me know if you find any!

#### <u>Installation:</u>

   Simply download the latest release from the [releases page](https://github.com/ITCMD/defcon-level/releases), and extract the files. Take the folder and place it somewhere in which it will be convenient to leave running. Run the script by running the  `DefconWarningSystemLauncher.vbs` file. 

​	If you want the script to run on startup, copy the `DefconWarningSystemLauncher.vbs`  file to the folder: `shell:startup`. Then run the  `DefconWarningSystemLauncher.vbs` file **in the original folder, not the startup folder** one more time, and it should prompt you to link the vbs file to your computer.

​	You can also use the task scheduler to run the `vbs` file mentioned above automatically.



#### <u>Updating:</u>

​	To update, delete all of the files in the defcon-level directory, and download this repo again.

​	This is until a better update option can be found and created that is also secure.



###### Disclaimer:

   I am not the owner of defconwarningsystem.com. The owner does not take responsibility for your actions based off of the Defcon Warning System's status. All civilians should make educated decisions based on their own knowledge. I, the creator of this program, also do not take any responsibility for your actions in result to the usage of this program.

###### Used Tools:

- Volume up jscript tool by foxdrive: https://stackoverflow.com/a/22895700/7872447 used to turn up the volume
- Wscript Audio player by SachaDee: https://stackoverflow.com/a/23316395/7872447  used to make an alert sound
- Alert.Wav from Defcon Warning System: https://defconwarningsystem.com/  used to make an alert sound
- Winhttpjs.bat by npockmaka:  https://github.com/npocmaka/batch.scripts/blob/master/hybrids/jscript/winhttpjs.bat  used to query status
- CMDS.bat by ITCMD https://github.com/ITCMD/CMDS



### More Screenshots:

Running `Defcon GUI.bat` directly to check status:

![](https://i.imgur.com/o2pv6Ir.gif)

Other Automatic Defcon Levels:

![](https://i.imgur.com/QudDVTW.png)

![](https://i.imgur.com/MUis0uc.png)

![](https://i.imgur.com/9Y5jsGt.png)

![](https://i.imgur.com/eLn09BX.png)
