# defcon-level
# Defcon-Warning-System Level Detection Tool (bat/jscript/vbscript tool)

![](https://i.imgur.com/P4cFzUJ.png)

​    This Program is designed for use with the unofficial Defcon Warning System (https://defconwarningsystem.com/ ). It queries the status and freaks the heck out if it goes down to Defcon One.

​    It is designed to be run minimized on startup. It was created in reaction to some possible malware in the Defcon Warning System's executables, which is not open source. Discussion on this can be found [here](https://www.defconwarningsystem.com/phpBB3/viewtopic.php?f=24&t=13798). While most suspicions were put to rest, this program still exists as an alternative. This code is completely open source. Their program is a bit more subtle, and it also checks for tweets by the Defcon Warning System. It can be found [here](https://defconwarningsystem.com/links-tools/#Applications).


#### <u>**How it Works:**</u>

​    This program queries the defconwarningsystem.com's Defcon level every ten minutes using [winhttpjs](https://github.com/npocmaka/batch.scripts/blob/master/hybrids/jscript/winhttpjs.bat), and reacts depending on the level with an alert sound, and an update on screen. If the level goes down to one, it will turn up the volume using [jscript](https://stackoverflow.com/a/22895700/7872447) (to make sure you hear the alert) and play the alert until you close the program. It will also read the Defcon status out loud for both Defcon two and one.

​	**Users can also run custom commands at any level** by editing the code and changing the variables at the beginning of the script from rem to anything else. It is recommended you use this space to start a program that performs your wanted actions. This way, if they fail, it will not damage this script.



#### <u>Known Issues:</u>

   There is currently only one known issue. The volume up script leaves command prompt windows open after it executes (they are minimized, but still annoying). If anyone knows how to fix this please let me know.





###### Disclaimer:

   I am not the owner of defconwarningsystem.com. The owner does not take responsibility for your actions based off of the Defcon Warning System's status. All civilians should make educated decisions based on their own knowledge. I, the creator of this program, also do not take any responsibility for your actions in result to the usage of this program.

###### Used Tools:

- Volume up jscript tool by foxdrive: https://stackoverflow.com/a/22895700/7872447 used to turn up the volume

- Wscript Audio player by SachaDee: https://stackoverflow.com/a/23316395/7872447  used to make an alert sound

- Alert.Wav from Defcon Warning System: https://defconwarningsystem.com/  used to make an alert sound

- Winhttpjs.bat by npockmaka:  https://github.com/npocmaka/batch.scripts/blob/master/hybrids/jscript/winhttpjs.bat  used to query status
