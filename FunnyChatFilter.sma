#include <sourcemod>

#define PLUGIN_VERSION   "1.0"

public Plugin:myinfo = {
    name = "FunnyChatFilter",
    author = "Rottweiler",
    description = "Funny chat filter",
    version = PLUGIN_VERSION,
    url = "https://forums.alliedmods.net/"
};

new const String:autoreplies[11][ 60 ] =
{
"sup guys <3",
"i love playin with yall",
"check out my moves",
"bet u cant come get me, tee hee",
"<3",
"imma chase u lulzzz",
"i love playin with you guys",
"tee hee",
"oh noo dont chase me lulzzzz",
"you gotta lovs a hard days of wowks",
"kawaii ^^"
};

public OnPluginStart() 
{
    AddCommandListener(SayHook, "say");   
}

public Action:SayHook(client, const String:command[], args)  
{
	int random = GetRandomInt(0, 10);
	new String:szText[256];
	GetCmdArg(1, szText, sizeof(szText));
	PrintToServer("%N: %s", client, szText);
	PrintToChatAll("%N: %s", client, autoreplies[random]); 
	return Plugin_Handled;
} 
