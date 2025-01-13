#include <sourcemod>
#include <sdktools>

#define PLUGIN_VERSION "1.0"

new const String:skinNames[8][ 60 ] =
{
"models/player/mp/gman/gman.mdl",
"models/player/mp/robo/robo.mdl",
"models/player/mp/barney/barney.mdl",
"models/player/mp/gina/gina.mdl",
"models/player/mp/helmet/helmet.mdl",
"models/player/mp/hgrunt/hgrunt.mdl",
"models/player/mp/scientist/scientist.mdl",
"models/player/mp/zombie/zombie.mdl"
};

public Plugin:myinfo = {
	name = "RndPlayerModel",
	author = "Rottweiler",
	version = PLUGIN_VERSION,
	description = "Random player model",
	url = "http://www.sourcemod.net"
};

public void OnMapStart() {
	PrecacheModel("models/player/mp/gman/gman.mdl", true);
	PrecacheModel("models/player/mp/robo/robo.mdl", true);
	PrecacheModel("models/player/mp/barney/barney.mdl", true);
	PrecacheModel("models/player/mp/gina/gina.mdl", true);
	PrecacheModel("models/player/mp/helmet/helmet.mdl", true);
	PrecacheModel("models/player/mp/hgrunt/hgrunt.mdl", true);
	PrecacheModel("models/player/mp/scientist/scientist.mdl", true);
	PrecacheModel("models/player/mp/zombie/zombie.mdl", true);
}

public OnPluginStart() {
	HookEvent("player_spawn", EventPlayerSpawn);
}

public Action:EventPlayerSpawn(Handle:event,const String:name[],bool:dontBroadcast)
{   
    CreateTimer(0.1,SetModel, GetClientOfUserId(GetEventInt(event,  "userid")));
    return Plugin_Continue;
}
public Action:SetModel(Handle:timer, any:client)
{       
    if (IsClientInGame(client) && IsPlayerAlive(client) && !IsFakeClient(client)) {
		int random = GetRandomInt(0, 7);
		SetEntityModel(client, skinNames[random]);
    }
    return Plugin_Continue;
} 
