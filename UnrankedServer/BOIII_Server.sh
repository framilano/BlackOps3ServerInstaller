#///////////////////////////////////////////////////////////////////////
#///  	      BOIII Dedicated Server Configuration start-up file     ///
#///////////////////////////////////////////////////////////////////////
#//                                                                   //
#//                    Your Game Server Port.	       	       	      //
#//            Make sure you Port Forward both UDP & TCP              //
#///////////////////////////////////////////////////////////////////////

GamePort=27017

#///////////////////////////////////////////////////////////////////////
#// Below edits are optional unless you run multiable servers or mods.//
#///////////////////////////////////////////////////////////////////////
#//               Load a mod on your server                           //
#//	           Example: ModfolderName=mods/bots                       //
#//                                                                   //
#//               UNLOAD a mod on your server                         //
#//               Example: ModfolderName=                             //
#///////////////////////////////////////////////////////////////////////

ModFolderName=

#/////////////////////////////////////////////////////////////////////////
#// 	Your edited server.cfg in the "zone" folder goes here...        //
#//	This is were you edit your hostname, rcon, inactivity, etc          //
#//                          (Optional)                                 //
#// Use server.cfg for MP, server_zm.cfg for Zombies and server_cp.cfg  //
#//                     for the campaign coop                           //     
#/////////////////////////////////////////////////////////////////////////

ServerFilename=server_mp.cfg

#///////////////////////////////////////////////////////////////////////
#//DONE!! WARNING! Don't mess with anything below this line. SERIOUSLY!//
#///////////////////////////////////////////////////////////////////////

wine boiii.exe -dedicated -headless +set fs_game "$ModFolderName" +set net_port "$GamePort" +set logfile 2 +exec $ServerFilename