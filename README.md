# Defcon Level (Version 2)
# Defcon-Warning-System Level Detection Tool (bat/jscript/vbscript tool)

![](https://i.imgur.com/P4cFzUJ.png)

​    This Program is designed for use with the unofficial Defcon Warning System (https://defconwarningsystem.com/ ). It queries the status and freaks the heck out if it goes down to Defcon One.

​    It is designed to be run minimized on startup. It was created in reaction to some possible malware in the Defcon Warning System's executables, which is not open source. Discussion on this can be found [here](https://www.defconwarningsystem.com/phpBB3/viewtopic.php?f=24&t=13798). While most suspicions were put to rest, this program still exists as an alternative. This code is completely open source. However, their program is a bit more polished and subtle, and it also checks for tweets by the Defcon Warning System. It can be found [here](https://defconwarningsystem.com/links-tools/#Applications).


#### <u>**How it Works:**</u>

<<<<<<< HEAD
​    This program queries the defconwarningsystem.com's Defcon level using [winhttpjs](https://github.com/npocmaka/batch.scripts/blob/master/hybrids/jscript/winhttpjs.bat), and reacts depending on the level with an alert sound, and an update on screen. If the level goes down to one, it will turn up the volume using [jscript](https://stackoverflow.com/a/22895700/7872447) (to make sure you hear the alert) and play the alert until you close the program. It will also read the Defcon status out loud for both Defcon two and one. As of the latest update it runs in the background. In order to have it run on startup you will have to follow the instructions below in Installation.

​	**Users can also run custom commands at any level** by editing the code and changing the variables at the beginning of the script from rem to anything else. It is recommended you use this space to start a program that performs your wanted actions. This way, if they fail, it will not damage this script. **The script now also checks for updates automatically, but will not install them automatically for security.**
=======
​    This program queries the defconwarningsystem.com's Defcon level every ten minutes using [winhttpjs](https://github.com/npocmaka/batch.scripts/blob/master/hybrids/jscript/winhttpjs.bat), and reacts depending on the level with an alert sound, and an update on screen. If the level goes down to one, it will turn up the volume using [jscript](https://stackoverflow.com/a/22895700/7872447) (to make sure you hear the alert) and play the alert until you close the program. It will also read the Defcon status out loud for both Defcon two and one.

​	**Users can also run custom commands at any level** by editing the code and changing the variables at the beginning of the script from `rem` to their wanted command. It is recommended you use this space to start a program that performs your wanted actions. This way, if they fail, it will not damage this script.
>>>>>>> a6b585c763fe693e8809dda9afe0ad47d0cef53a


#### <u>**Installation:**</u>
​    To install, simply download all of the files in this folder and run "Defcon-level.bat" You can create a shortcut to the script and place it in the folder `shell:startup` to have the program automatically run.

#### <u>Known Issues:</u>

   None as of now, I fixed them all! Let me know if you find any!

#### <u>Installation:</u>

   Simply download all of the files on this page and place the folder somewhere you want it. Run the script by running the  `DefconWarningSystemLauncher.vbs` file. 

​	If you want the script to run on startup, copy the `DefconWarningSystemLauncher.vbs`  file to the folder: `shell:startup`. Then run the  `DefconWarningSystemLauncher.vbs` file **in the original folder, not the startup folder** one more time, and it should prompt you to link the vbs file to your computer.

​	You can also use the task scheduler to run the `vbs` file mentioned above automatically.



###### Disclaimer:

   I am not the owner of defconwarningsystem.com. The owner does not take responsibility for your actions based off of the Defcon Warning System's status. All civilians should make educated decisions based on their own knowledge. I, the creator of this program, also do not take any responsibility for your actions in result to the usage of this program.

###### Used Tools:

- Volume up jscript tool by foxdrive: https://stackoverflow.com/a/22895700/7872447 used to turn up the volume

- Wscript Audio player by SachaDee: https://stackoverflow.com/a/23316395/7872447  used to make an alert sound

- Alert.Wav from Defcon Warning System: https://defconwarningsystem.com/  used to make an alert sound

- Winhttpjs.bat by npockmaka:  https://github.com/npocmaka/batch.scripts/blob/master/hybrids/jscript/winhttpjs.bat  used to query status
