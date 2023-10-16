//::///////////////////////////////////////////////
//:: Name bat2_wave4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Battle 2 - Wave 4 Spawn Attack...

    Create the first group of Mindflayer and Beholder attackers
    have them advance to the Seer.
    Signal the Drow Defenders to advance to meet them.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 11/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
#include "q2_inc_battle"

void SpawnBeholder(string szResRef, location lSpawn);
void SpawnMindFlayer(string szResRef, location lSpawn);

void main()
{

    if (GetLocalInt(GetModule(), "X2_Q2Battle2Wave4Spawned") == 1)
        return;
    SetLocalInt(GetModule(), "X2_Q2Battle2Wave4Spawned", 1);
    //Target for the attackers
    object oSeer = GetObjectByTag("q2aseer");

    //Change the Background battle noises
    object oArea = GetArea(OBJECT_SELF);
    AmbientSoundStop(oArea);
    AmbientSoundChangeDay(oArea, 27);
    AmbientSoundChangeNight(oArea, 27);
    AmbientSoundPlay(oArea);

    //Have seer start doing her defensive casts again
    SetLocalInt(oSeer, "Q2B_CASTING", 1);
    DelayCommand(12.0, SignalEvent(oSeer, EventUserDefined(999)));

    //possible spawn points (3 is by the gate)
    location lSpawnB1 = GetLocation(GetWaypointByTag("cut107wp_beholderspawn1"));
    location lSpawnB2 = GetLocation(GetWaypointByTag("cut107wp_beholderspawn2"));
    location lSpawnM1 = GetLocation(GetWaypointByTag("cut106wp_umberspawn1"));
    location lSpawnM2 = GetLocation(GetWaypointByTag("cut106wp_umberspawn2"));
    location lSpawnM3 = GetLocation(GetWaypointByTag("cut106wp_umberspawn3"));

    if (GetGlobalInt("x2_plot_beholders_out") == 0)
    {
        //Spawn in Beholders
        SpawnBeholder("q2a_bat2_beh1", lSpawnB1);
        SpawnBeholder("q2a_bat2_beh2", lSpawnB2);

        DelayCommand(5.0, SpawnBeholder("q2a_bat2_beh2", lSpawnB1));
        DelayCommand(5.0, SpawnBeholder("q2a_bat2_beh1", lSpawnB2));

        DelayCommand(10.0, SpawnBeholder("q2a_bat2_beh1", lSpawnB1));
        DelayCommand(10.0, SpawnBeholder("q2a_bat2_beh1", lSpawnB2));

        DelayCommand(20.0, SpawnBeholder("q2a_bat2_beh1", lSpawnB1));
        DelayCommand(20.0, SpawnBeholder("q2a_bat2_beh2", lSpawnB2));
    }
    if (GetGlobalInt("X2_Q2DOvermind") < 2)
    {
        //Spawn in Mindflayers
        SpawnMindFlayer("q2a_bat2_mf2", lSpawnM1);
        SpawnMindFlayer("q2a_bat2_mf2", lSpawnM2);
        SpawnMindFlayer("q2a_bat2_mf2", lSpawnM3);

        DelayCommand(5.0, SpawnMindFlayer("q2a_bat2_mf1", lSpawnM1));
        DelayCommand(5.0, SpawnMindFlayer("q2a_bat2_mf1", lSpawnM2));
        DelayCommand(5.0, SpawnMindFlayer("q2a_bat2_mf2", lSpawnM3));

        DelayCommand(15.0, SpawnMindFlayer("q2a_bat2_mfx", lSpawnM1));
        DelayCommand(15.0, SpawnMindFlayer("q2a_bat2_mf1", lSpawnM2));
        DelayCommand(15.0, SpawnMindFlayer("q2a_bat2_mf2", lSpawnM3));
    }

    object oBattleMaster = OBJECT_SELF;
    SignalEvent(oBattleMaster, EventUserDefined(BATTLE2_WAVE4_REBEL_ADVANCE));

}

void SpawnBeholder(string szResRef, location lSpawn)
{
     //The Seer
    object oSeer = GetObjectByTag("q2aseer");
    object oBeholder = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, TRUE);
    SetLocalObject(oBeholder, "oTarget", oSeer);
    AssignCommand(oBeholder, ActionMoveToObject(oSeer, TRUE));
    DelayCommand(6.0 + IntToFloat(Random(4)), SignalEvent(oBeholder, EventUserDefined(5000)));
}

void SpawnMindFlayer(string szResRef, location lSpawn)
{
     //The Seer
    object oSeer = GetObjectByTag("q2aseer");
    object oMind = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn);
    SetLocalObject(oMind, "oTarget", oSeer);
    AssignCommand(oMind, ActionMoveToObject(oSeer, TRUE));
    DelayCommand(6.0 + IntToFloat(Random(4)), SignalEvent(oMind, EventUserDefined(5000)));
}
