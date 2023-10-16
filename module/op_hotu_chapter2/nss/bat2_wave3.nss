//::///////////////////////////////////////////////
//:: Name bat2_wave3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Battle 2 - Wave 3 Spawn Attack...

    Create the first group of Drow attackers
    have them advance to the Seer.
    Signal the Drow Defenders to advance to meet them.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 11/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
#include "q2_inc_battle"

void CreateDrow(string szResRef, location lSpawn);

void main()
{
    //SendMessageToPC(GetFirstPC(), "In Wave 3");
    if (GetLocalInt(GetModule(), "X2_Q2Battle2Wave3Spawned") == 1)
        return;
    SetLocalInt(GetModule(), "X2_Q2Battle2Wave3Spawned", 1);
    //Target for the attackers
    object oSeer = GetObjectByTag("q2aseer");
    //Have seer start doing her defensive casts again
    SetLocalInt(oSeer, "Q2B_CASTING", 1);
    DelayCommand(12.0, SignalEvent(oSeer, EventUserDefined(999)));

    //possible spawn points (3 is by the gate)
    location lSpawn1 = GetLocation(GetWaypointByTag("wp_bat2_wave3_spawn1"));
    location lSpawn2 = GetLocation(GetWaypointByTag("wp_bat2_wave3_spawn2"));
    location lSpawn3 = GetLocation(GetWaypointByTag("wp_bat2_wave3_spawn3"));

    //Spawn in soldiers
    CreateDrow("bat2_drow1", lSpawn1);
    CreateDrow("bat2_drow1", lSpawn1);
    CreateDrow("bat2_drow1", lSpawn1);
    CreateDrow("bat2_drow2", lSpawn1);
    CreateDrow("bat2_drow2", lSpawn1);

    CreateDrow("bat2_drow1", lSpawn2);
    CreateDrow("bat2_drow2", lSpawn2);
    CreateDrow("bat2_drow2", lSpawn2);
    CreateDrow("bat2_drow1", lSpawn2);
    CreateDrow("bat2_drow1", lSpawn2);

    //Spawn in mage
    CreateDrow("bat2_drow3", lSpawn3);

    object oBattleMaster = OBJECT_SELF;
    SignalEvent(oBattleMaster, EventUserDefined(BATTLE2_WAVE3_REBEL_ADVANCE));

}

void CreateDrow(string szResRef, location lSpawn)
{
     //The Seer
    object oSeer = GetObjectByTag("q2aseer");
    object oDrow = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn);
    SetLocalObject(oDrow, "oTarget", oSeer);
    AssignCommand(oDrow, ActionMoveToObject(oSeer, TRUE));
    DelayCommand(6.0 + IntToFloat(Random(4)), SignalEvent(oDrow, EventUserDefined(5000)));
}
