//::///////////////////////////////////////////////
//:: Name bat1_spawnatk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Spawn the attackers in..

*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 27/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"

void SpawnGroup(int nFormation, string szResRef, object oTarget);
void SpawnGroupAt(int nFormation, string szResRef, object oTarget, location lSpawn);
void CreateUndead(location lSpawn, object oTarget);
void SetFormation(int nFormation, string szResRef);
//Create a drow catapult team at the given location
void CreateDrowCatapult(location lCatapult1);

void main()
{
    string szDuergar = "q2a_bat1_duer1";
    string szDuergar2 = "q2a_bat1_duer2";
    string szGuard = "q2a_bat1_duer3";

    string szArcher = "x2_q2drowwarrio2";

    object oGate1 = GetObjectByTag("q2acitygate");
    object oGate2 = GetObjectByTag("q2ainnergate");
    object oArea = GetArea(oGate1);


    if (GetLocalInt(oArea, "nSpawnedAttack") == 1)
        return;
    SetLocalInt(oArea, "nSpawnedAttack", 1);

    //Change the music in the area.
    MusicBackgroundChangeDay(oArea, TRACK_BATTLE_DUNGEON2);
    MusicBackgroundChangeNight(oArea, TRACK_BATTLE_DUNGEON2);
    MusicBackgroundPlay(oArea);

    object oArcher1 = GetObjectByTag("wp_gate1archtarget_1");
    object oArcher2 = GetObjectByTag("wp_gate1archtarget_2");
    //Drow Catapult teams
    location lCatapult1 = GetLocation(GetWaypointByTag("wp_bat1_drowcat1"));
    location lCatapult2 = GetLocation(GetWaypointByTag("wp_bat1_drowcat2"));
    CreateDrowCatapult(lCatapult1);
    CreateDrowCatapult(lCatapult2);

    //Create the tunnel locations for duergar sappers
    location lHole1Spawn = GetLocation(GetWaypointByTag("wp_q2a_bat1_hole1"));
    location lHole2Spawn = GetLocation(GetWaypointByTag("wp_q2a_bat1_hole2"));
    object oHole1 = CreateObject(OBJECT_TYPE_PLACEABLE, "q2a_bat1_hole1", lHole1Spawn);
    object oHole2 = CreateObject(OBJECT_TYPE_PLACEABLE, "q2a_bat1_hole2", lHole2Spawn);


    object oSpawn1 = GetObjectByTag("wp_bat1_drowspawn1");
    object oSpawn2 = GetObjectByTag("wp_bat1_drowspawn2");
    object oSpawn3 = GetObjectByTag("wp_bat1_drowspawn3");


    //Priest and Wizard
    object oPriestSpawn = GetWaypointByTag("wp_battle1_priestspawn");
    CreateObject(OBJECT_TYPE_CREATURE, "bat1_drowpriest", GetLocation(oPriestSpawn));
    CreateObject(OBJECT_TYPE_CREATURE, "q2abat1_wiz1", GetLocation(oPriestSpawn));

    //Field General
    object oTentSpawn = GetWaypointByTag("wp_bat1_tentspawn");
    object oGeneralSpawn = GetWaypointByTag("wp_bat1_command");
    object oGuardSpawn1 = GetWaypointByTag("wp_bat1_genguard1");
    object oGuardSpawn2 = GetWaypointByTag("wp_bat1_genguard2");
    object oGuardSpawn3 = GetWaypointByTag("wp_bat1_genguard3");
    object oGuardSpawn4 = GetWaypointByTag("wp_bat1_genguard4");

    CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_tent_b", GetLocation(oTentSpawn));
    object oCommander = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowcom", GetLocation(oGeneralSpawn));
    DelayCommand(18.0, SignalEvent(oCommander, EventUserDefined(500)));

    CreateObject(OBJECT_TYPE_CREATURE, szGuard, GetLocation(oGuardSpawn1), FALSE, "q2a_bat1_guard1");
    CreateObject(OBJECT_TYPE_CREATURE, szGuard, GetLocation(oGuardSpawn2), FALSE, "q2a_bat1_guard2");
    CreateObject(OBJECT_TYPE_CREATURE, szGuard, GetLocation(oGuardSpawn3), FALSE, "q2a_bat1_guard3");
    CreateObject(OBJECT_TYPE_CREATURE, szGuard, GetLocation(oGuardSpawn4), FALSE, "q2a_bat1_guard4");

    //Wave 1
    SpawnGroupAt(1, szDuergar, oGate1, GetLocation(oSpawn1));
    SpawnGroupAt(2, szDuergar, oGate1, GetLocation(oSpawn2));
    SpawnGroupAt(3, szDuergar2, oGate1, GetLocation(oSpawn3));


   //Matron will have undead in her army unless the PC has prevented this
    //x2_plot_undead_out == 1
    location lSpawn1 = GetLocation(GetWaypointByTag("wp_bat1_drowspawn1"));
    if (GetGlobalInt("x2_plot_undead_out") == 0)
    {
        CreateUndead(lSpawn1, oGate1);
    }



    //Keep track of formation count for dynamic squad creation
    SetLocalInt(GetModule(), "X2_Q2ABattle1FormCount", 5);

    //Set a variable to show that battle 1 is ongoing
    SetLocalInt(GetModule(), "X2_Q2ABattle1Started", 1);

    //Make front Gate bashable
    SetPlotFlag(oGate1, FALSE);

    //close and lock inner gate
    AssignCommand(oGate2, ActionCloseDoor(oGate2));
    SetLocked(oGate2, TRUE);
    SetPlotFlag(oGate2, FALSE);

    //Change ambient sounds to battle sounds.
    AmbientSoundChangeDay(oArea, 26);
    AmbientSoundChangeNight(oArea, 26);
    AmbientSoundPlay(oArea);
}

void SpawnGroup(int nFormation, string szResRef, object oTarget)
{
    //object oPC = GetFirstPC();
    if (GetIsObjectValid(oTarget) == FALSE)
        oTarget = GetObjectByTag("q2ainnergate");
    object oBattleMaster = GetObjectByTag("bat1_battlemaster");
    //Track how many Drow formations have been created (for retreat purposes)

    SetLocalInt(oBattleMaster, "nBattle1DrowFormCount", GetLocalInt(oBattleMaster, "nBattle1DrowFormCount") + 1);

    location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_drowspawn" + IntToString(Random(3) + 1)));
    int nCount;
    object oCreature;
    for (nCount = 1; nCount < 6; nCount++)
    {
        oCreature = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, FALSE, szResRef + IntToString(nFormation) + IntToString(nCount));
        if (nCount == 1)
        {
            //Store a pointer to the leader of each group on the battlemaster
            SetLocalObject(oBattleMaster, "oFormationLeader" + IntToString(nFormation), oCreature);

            SetLocalInt(oCreature, "nLeader", 1);                     //ADVANCE
            DelayCommand(2.0, SignalEvent(oCreature, EventUserDefined(5000)));
        }
        SetLocalInt(oCreature, "nFormation", nFormation);
        SetLocalObject(oCreature, "oTarget", oTarget);
        //SendMessageToPC(oPC, GetTag(oCreature));
    }
    SetFormation(nFormation, szResRef);
}
void SpawnGroupAt(int nFormation, string szResRef, object oTarget, location lSpawn)
{
    //object oPC = GetFirstPC();
    if (GetIsObjectValid(oTarget) == FALSE)
        oTarget = GetObjectByTag("q2ainnergate");
    object oBattleMaster = GetObjectByTag("bat1_battlemaster");
    //Track how many Drow formations have been created (for retreat purposes)

    SetLocalInt(oBattleMaster, "nBattle1DrowFormCount", GetLocalInt(oBattleMaster, "nBattle1DrowFormCount") + 1);

    //location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_drowspawn" + IntToString(Random(3) + 1)));
    int nCount;
    object oCreature;
    for (nCount = 1; nCount < 6; nCount++)
    {
        oCreature = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, FALSE, szResRef + IntToString(nFormation) + IntToString(nCount));
        if (nCount == 1)
        {
            //Store a pointer to the leader of each group on the battlemaster
            SetLocalObject(oBattleMaster, "oFormationLeader" + IntToString(nFormation), oCreature);

            SetLocalInt(oCreature, "nLeader", 1);                     //ADVANCE
            DelayCommand(2.0, SignalEvent(oCreature, EventUserDefined(5000)));
        }
        SetLocalInt(oCreature, "nFormation", nFormation);
        SetLocalObject(oCreature, "oTarget", oTarget);
        //SendMessageToPC(oPC, GetTag(oCreature));
    }
    SetFormation(nFormation, szResRef);
}
void SetFormation(int nFormation, string szResRef)
{
//    all members of the formation will have pointers to all other members stored locally
    object oPC = GetFirstPC();
    int nCount = 1;
    int nCount2 = 1;
    object oFormMember;
    object oPointer;
    for (nCount = 1; nCount < 6; nCount++)
    {
        oFormMember = GetObjectByTag(szResRef + IntToString(nFormation) + IntToString(nCount));
        //SendMessageToPC(oPC, "oFormMember" + IntToString(nCount) + " gets:");

        for (nCount2 = 1; nCount2 < 6; nCount2++)
        {
            oPointer = GetObjectByTag(szResRef + IntToString(nFormation) + IntToString(nCount2));
            SetLocalObject(oFormMember, "oFormMember" + IntToString(nCount2), oPointer);
            //SendMessageToPC(oPC, GetTag(oPointer));
        }
    }

}

void CreateUndead(location lSpawn, object oTarget)
{
    string szDeathKnight = "q2a_bat1_undead1";
    string szSkelWar = "q2a_bat1_undead2";
    string szSkelArch = "q2a_bat1_undead3";
    string szBoneGolem = "q2a_bat1_undead4";
    object oSpawn1 = GetObjectByTag("wp_bat1_drowspawn1");
    object oSpawn2 = GetObjectByTag("wp_bat1_drowspawn2");
    object oSpawn3 = GetObjectByTag("wp_bat1_drowspawn3");

   //SendMessageToPC(GetFirstPC(), "Spawning Undead");
    //DelayCommand(15.0, SpawnGroupAt(4, szBoneGolem, oTarget, GetLocation(oSpawn1)));
    //DelayCommand(45.0, SpawnGroupAt(11, szSkelWar, oTarget, GetLocation(oSpawn2)));
    //DelayCommand(45.0, SpawnGroupAt(12, szSkelWar, oTarget, GetLocation(oSpawn3)));
    //DelayCommand(50.0, SpawnGroupAt(13, szSkelArch, oTarget, GetLocation(oSpawn2)));
    //DelayCommand(55.0, SpawnGroupAt(14, szDeathKnight, oTarget, GetLocation(oSpawn2)));
    location lSpawn = GetLocation(oSpawn2);
    object oGolem1 = CreateObject(OBJECT_TYPE_CREATURE, szBoneGolem, lSpawn, FALSE, "bat1_undead1");
    object oGolem2 = CreateObject(OBJECT_TYPE_CREATURE, szBoneGolem, lSpawn, FALSE, "bat1_undead2");

    DelayCommand(2.0, SignalEvent(oGolem1, EventUserDefined(500)));
    DelayCommand(2.0, SignalEvent(oGolem2, EventUserDefined(500)));

}

//Create a drow catapult team at the given location
void CreateDrowCatapult(location lCatapult)
{
    object oCat = CreateObject(OBJECT_TYPE_PLACEABLE, "q2a_bat1drowcat", lCatapult);
    CreateObject(OBJECT_TYPE_CREATURE, "q2a_drowcatteam", lCatapult);
    CreateObject(OBJECT_TYPE_CREATURE, "q2a_drowcatteam", lCatapult);
}

