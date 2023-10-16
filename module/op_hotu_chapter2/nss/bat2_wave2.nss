//::///////////////////////////////////////////////
//:: Name bat2_wave2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Battle 2 - Wave 2 Spawn Attack...

    Create the first group of Duergar attackers
    have them advance to the Seer.
    Signal the Drow Defenders to advance to meet them.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 11/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
#include "q2_inc_battle"

void CreateDuergar(string szResRef, location lSpawn);

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2Battle2Wave2Spawned") == 1)
        return;
    SetLocalInt(GetModule(), "X2_Q2Battle2Wave2Spawned", 1);
    //Target for the attackers
    object oSeer = GetObjectByTag("q2aseer");

    //possible spawn points (3 is by the gate)
    location lSpawn1 = GetLocation(GetWaypointByTag("bat2wp_wave2spawn1"));
    location lSpawn2 = GetLocation(GetWaypointByTag("bat2wp_wave2spawn2"));
    location lSpawn3 = GetLocation(GetWaypointByTag("bat2wp_wave2spawn3"));

    //Spawn in soldiers
    CreateDuergar("q2a_bat2_duer2", lSpawn1);
    CreateDuergar("q2a_bat2_duer2", lSpawn1);
    CreateDuergar("q2a_bat2_duer1", lSpawn1);
    CreateDuergar("q2a_bat2_duer1", lSpawn1);
    CreateDuergar("q2a_bat2_duer1", lSpawn1);

    CreateDuergar("q2a_bat2_duer2", lSpawn2);
    CreateDuergar("q2a_bat2_duer2", lSpawn2);
    CreateDuergar("q2a_bat2_duer1", lSpawn2);
    CreateDuergar("q2a_bat2_duer1", lSpawn2);
    CreateDuergar("q2a_bat2_duer1", lSpawn2);

    //Spawn in mage
    CreateDuergar("q2a_bat2_duer3", lSpawn3);

    //Spawn in BoneGolem if necessary
    if (GetGlobalInt("x2_plot_undead_out") == 0)
    {
        //CreateDuergar("q2a_bat2_undead3", lSpawn3);
        string szBoneGolem = "q2a_bat2_bonegol";
        object oGolem1 = CreateObject(OBJECT_TYPE_CREATURE, szBoneGolem, lSpawn2, FALSE, "bat2_undead1");
        DelayCommand(2.0, SignalEvent(oGolem1, EventUserDefined(500)));

    }

    object oBattleMaster = OBJECT_SELF;
    SignalEvent(oBattleMaster, EventUserDefined(BATTLE2_WAVE2_REBEL_ADVANCE));

}

void CreateDuergar(string szResRef, location lSpawn)
{
     //The Seer
    object oSeer = GetObjectByTag("q2aseer");
    object oDuergar = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn);
    SetLocalObject(oDuergar, "oTarget", oSeer);
    AssignCommand(oDuergar, ActionMoveToObject(oSeer, TRUE));
    DelayCommand(6.0 + IntToFloat(Random(4)), SignalEvent(oDuergar, EventUserDefined(5000)));
}
