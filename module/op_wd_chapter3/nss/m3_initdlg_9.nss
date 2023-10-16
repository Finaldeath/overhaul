//::///////////////////////////////////////////////
//:: M3_INITDLG_9.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Saves the object Id of the NPC
this is used in the trigger onExit script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May (using Aidan's Script)
//:: Created On: February 28, 2002
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"

void main()
{
    SetLocalObject(GetArea(OBJECT_SELF),"NW_G_" + GetTag(OBJECT_SELF),OBJECT_SELF);
    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1001
    SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);
    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
    WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is "POST_" + NPC TAG the creature will return this way point after
                               //    combat.
    GenerateNPCTreasure();     //* Use this to create a small amount of treasure on the creature
}
