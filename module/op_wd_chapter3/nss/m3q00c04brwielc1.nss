//::///////////////////////////////////////////////
//:: Start following the player
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets it up so on her heartbeat she will follow the
     player.  As well it activates the ambush.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"

void main()
{
    SetLocalInt(OBJECT_SELF, "NW_G_M3Q00TALKFOLLOWPC",1);
    SetLocalObject(GetModule(), "M3Q00OBRETFAMILY", GetPCSpeaker());
    SetEncounterActive(TRUE, GetObjectByTag("M3Q2C02WIFEAMBUS"));
    TakeBretRing(GetPCSpeaker());
}
