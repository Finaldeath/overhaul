//::///////////////////////////////////////////////
//:: Name bat2_spawndef2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in the defenders for Battle 2.
    These defenders are hostile to the PC.
    This is the spawn for after the PC has betrayed the Seer
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 5/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"


void SpawnGroup(int nFormation, string szResRef, string szTarget);
void SpawnHench(location lSeer);
void main()
{
    //the rebels will have 5 formations
    int nRebelForm = 4;

    location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_rebspawn"));

    object oTarget1 = GetWaypointByTag("wp_bat2_rebmoveto1");
    object oTarget2 = GetWaypointByTag("wp_bat2_rebmoveto2");
    object oTarget3 = GetWaypointByTag("wp_bat2_rebmoveto3");
    object oTarget4 = GetWaypointByTag("wp_bat2_rebmoveto4");
    object oTarget5 = GetWaypointByTag("wp_bat2_rebcleric1");
    string szTarget = "wp_bat2_rebmoveto";
    string szSword = "q2abat1reb1";
    string szMarksman = "q2abat1reb2";
    string szCleric = "q2abat1reb3";


    int nCount;
    for (nCount = 1; nCount <= nRebelForm; nCount++)
    {
        if (d20() > 10)
            SpawnGroup(nCount, szSword, szTarget + IntToString(nCount) + "_");
        else
            SpawnGroup(nCount, szMarksman, szTarget + IntToString(nCount)+ "_");
    }

    CreateRebelCleric(szCleric, lSpawn, oTarget5);
    CreateRebelCleric(szCleric, lSpawn, oTarget5);
    //Keep track of formation count for dynamic squad creation
    SetLocalInt(GetModule(), "X2_Q2ABattle2RebFormCount", nRebelForm + 1);


    //Spawn in the Seer and have her do her ritual..
    location lSeer = GetLocation(GetWaypointByTag("wp_bat2_seer"));
    //Create Rune Circle around seer
    CreateObject(OBJECT_TYPE_PLACEABLE, "x0_runecircle", lSeer);
    //Jump the seer down
    object oSeer = GetObjectByTag("q2aseer");
    SetPlotFlag(oSeer, FALSE);
    SetAILevel(oSeer,AI_LEVEL_NORMAL);

    SetLocalInt(oSeer, "Q2B_CASTING", 1); // used in seer's UD event
    AssignCommand(oSeer, JumpToLocation(lSeer));
    //Create the 2 henchmen to defend the Seer
    DelayCommand(2.0, SpawnHench(lSeer));


    DelayCommand(1.0, AssignCommand(oSeer, ClearAllActions()));
    //Because this is the evil path - change the faction to hostile for all defenders
    DelayCommand(1.0, ChangeToStandardFaction(oSeer, STANDARD_FACTION_HOSTILE));
    //Start the Seer Casting
    SignalEvent(oSeer, EventUserDefined(999));

    SetLocalInt(oSeer, "DIALOG_STATUS", 2);


}

void SpawnGroup(int nFormation, string szResRef, string szTarget)
{
    //SendMessageToPC(GetFirstPC(), "Spawning Group");
    location lSpawn = GetLocation(GetWaypointByTag("wp_bat2_rebspawn"));
    int nCount;
    object oCreature;
    //effect eVis = EffectVisualEffect(VFX_DUR_FLAG_GOLD);
    object oHelm;
    object oTarget;
    for (nCount = 1; nCount < 6; nCount++)
    {
        oCreature = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, FALSE, szResRef + IntToString(nFormation) + IntToString(nCount));
        //Because this is the evil path - change the faction to hostile for all defenders
        ChangeToStandardFaction(oCreature, STANDARD_FACTION_HOSTILE);

        if (nCount == 1)
        {
            SetLocalInt(oCreature, "nLeader", 1);

            //ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oCreature);
            //oHelm = CreateItemOnObject("q2arebleadhelm", oCreature);
            //AssignCommand(oCreature, ActionEquipItem(oHelm, INVENTORY_SLOT_HEAD));//ADVANCE
            DelayCommand(2.0, SignalEvent(oCreature, EventUserDefined(5000)));
        }
        oTarget = GetWaypointByTag(szTarget + IntToString(nCount));
        SetLocalInt(oCreature, "nFormation", nFormation);
        SetLocalObject(oCreature, "oTarget", oTarget);
        SetLocalObject(oCreature, "oMoveTarget", oTarget);
        DelayCommand(0.5, AssignCommand(oCreature, ActionForceMoveToObject(oTarget, TRUE, 1.0, 15.0)));
        DelayCommand(6.0, SignalEvent(oCreature, EventUserDefined(UNIT_MOVE_TO_TARGET)));

    }
    SetFormation(nFormation, szResRef);
}

void SpawnHench(location lSeer)
{
    object oNath = CreateObject(OBJECT_TYPE_CREATURE, "x2_reb_nathyra", lSeer);
    SetPlotFlag(oNath, FALSE);
    object oValen = CreateObject(OBJECT_TYPE_CREATURE, "x2_reb_valen", lSeer);
    SetPlotFlag(oValen, FALSE);
    //if the PC has set up the Deva to defend the Seer - spawn her in here.
    if (GetLocalInt(GetModule(), "X2_Battle2DevaWithSeer") == 1)
    {
        location lDeva = GetLocation(GetWaypointByTag("bat2wp_devastart"));
        object oDeva = CreateObject(OBJECT_TYPE_CREATURE, "q2dlavoera", lDeva);
        ChangeToStandardFaction(oDeva, STANDARD_FACTION_HOSTILE);
    }

    //if the PC has set up the Golems to defend the Seer - spawn them in here
    if (GetLocalInt(GetModule(), "X2_Battle2GolemsWithSeer") == 1)
    {
        location lSpawn = GetLocation(GetWaypointByTag("bat2wp_devastart"));
        object oGolem1 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bat_fleshgol", lSpawn);
        object oGolem2 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bat_silvgol", lSpawn);
        ChangeToStandardFaction(oGolem1, STANDARD_FACTION_HOSTILE);
        ChangeToStandardFaction(oGolem2, STANDARD_FACTION_HOSTILE);

    }
}
