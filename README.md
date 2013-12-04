FileMaker HipChat Sender
========================
*Author: Donald L. Merand*

Sends messages to a HipChat room from FileMaker, either via a FileMaker API script, or manually via a layout.

**NOTE: This file requires FileMaker Pro 13 to work. It will not work in previous versions of FileMaker, as it requires the HTTP POST functionality of FileMaker Pro 13**.


Setup
-----
1. Make sure you've got a [HipChat](http://www.hipchat.com) account and [API Token](https://www.hipchat.com/admin/api).
2. Open up the HipChat.fmp12 file.
3. Edit the custom function AUTHTOKEN and replace the return value with your API token obtained in step one.
  - *Note*: I'm using the convention of database-wide constants being stored in custom functions. I find the syntax very clean in my calculation fields.
4. You probably also want to edit the DEFAULTROOMID custom function to be your preferred room for posting automated/FileMaker messages in your HipChat account.


Sending Messages
----------------
You can send messages from the HIPCHAT layout, which is pretty obvious. You'll need to add at least one default room. See the section below on adding rooms.

To send a message, select a room, make sure to pick a "from" account (which you can make up), type in a message, and click "send". In the "result" box, you'll see whether the message went through, or whether HipChat's API returned any errors.

_The "results" tab shows you the result of the API query/post.


Creating and Importing Rooms
----------------------------
Once you've set up your API keys (which is covered in the "Setup" section above), you can just click the "refresh" button under "select room", and a list of your public, non-archived rooms will populate. If you want all of the rooms, you can tell the script to pull "archived" or "private" rooms.

You can also create rooms by hand if you know the room IDs of your HipChat rooms. You can get a list of those for your account (once logged in to HipChat) [at this link](https://proof.hipchat.com/account/xmpp).



Known Bugs/Quirks
-----------------
None at this time! Thanks FileMaker for giving us HTTP POST in version 13! The old way of doing this was to either use a webviewr (slow + quirky) or use CURL via an AppleScript running a terminal command (OS-X only). Now this file works cross-platform!

Credits
-------
- Interface icons come from [The Noun Project](http://thenounproject.com)
- _Excellent_ modular JSON parsing routines came from [ModularFileMaker.org](http://www.modularfilemaker.org/2013/08/json/)
