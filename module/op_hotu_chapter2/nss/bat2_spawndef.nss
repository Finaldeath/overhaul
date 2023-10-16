//::///////////////////////////////////////////////
//:: Name bat2_spawndef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in the defenders for Battle 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 3/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"

void SpawnHench(location lSeer);
void SpawnGroup(int nFormation, string szResRef, string szTarget);

void main()
{
     int nRebelForm = 3;
     //If the PC was victorious in Battle 1 - and an extra 2 units.
    if (GetLocalInt(GetModule(), "X2_Q2ABattle1Won") == 1)
        nRebelForm = nRebelForm + 1;
    //If the PC called for reinforcements in Battle 1 - subtract 1 unit
    if (GetLocalInt(GetModule(), "nBattle1Reinforced") == 1)
        nRebelForm = nRebelForm -  1;
    //Start with 3 units (so max 4/ min 2)
    location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_rebspawn"));

    object oTarget1 = GetWaypointByTag("wp_bat2_rebmoveto1");
    object oTarget2 = GetWaypointByTag("wp_bat2_rebmoveto2");
    object oTarget3 = GetWaypointByTag("wp_bat2_rebmoveto3");
    object oTarget4 = GetWaypointByTag("wp_bat2_rebmoveto4");
    object oTarget5 = GetWaypointByTag("wp_bat2_rebcleric1");
    string szTarget = "wp_bat2_rebmoveto";
    string szSword = "q2abat2reb1";
    string szMarksman = "q2abat2reb2";
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
    object oSeerJump = GetWaypointByTag("wp_bat2_seer");
    location lSeer = GetLocation(GetWaypointByTag("wp_bat2_seer"));
    location lHench = GetLocation(GetWaypointByTag("wp_bat2_henchspawn"));
    //Create Rune Circle around seer
    CreateObject(OBJECT_TYPE_PLACEABLE, "x0_runecircle", lSeer);

    //Jump the seer down
    object oSeer = GetObjectByTag("q2aseer");
    SetAILevel(oSeer, AI_LEVEL_NORMAL);
    SetPlotFlag(oSeer, FALSE);
    AssignCommand(oSeer, JumpToObject(oSeerJump));
    object oStaff = GetItemPossessedBy(oSeer, "NW_WMGST003");
    SetLocalInt(oSeer, "Q2B_CASTING", 1); // used in seer's UD event
    //Create the 2 henchmen to defend the Seer
    DelayCommand(2.0, SpawnHench(lHench));

    DelayCommand(1.0, AssignCommand(oSeer, ClearAllActions()));
    DelayCommand(8.0, AssignCommand(oSeer, ActionEquipItem(oStaff, INVENTORY_SLOT_RIGHTHAND)));
    //Start the Seer Casting
    DelayCommand(10.0, SignalEvent(oSeer, EventUserDefined(998)));
    DelayCommand(14.0, SignalEvent(oSeer, EventUserDefined(999)));
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
    object oPC = GetFirstPC();
    for (nCount = 1; nCount < 6; nCount++)
    {
        oCreature = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, FALSE, szResRef + IntToString(nFormation) + IntToString(nCount));
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
        DelayCommand(20.0, SignalEvent(oCreature, EventUserDefined(UNIT_MOVE_TO_TARGET)));

    }
    SetFormation(nFormation, szResRef);
}

void SpawnHench(location lSeer)
{
    object oNath = GetObjectByTag("x2_hen_nathyra");
    if (GetIsObjectValid(GetMaster(oNath)) == FALSE)
    {
        ChangeToStandardFaction(oNath, STANDARD_FACTION_COMMONER);
        AssignCommand(oNath, JumpToLocation(lSeer));
        int nMaxLevel = 15;
        int nNathLevel = GetHitDice(oNath);
        while (nNathLevel <= nMaxLevel && nNathLevel != 0)
        {
            nNathLevel = LevelUpHenchman(oNath, CLASS_TYPE_INVALID, TRUE);
        }
    }
    object oValen = GetObjectByTag("x2_hen_valen");
    if (GetIsObjectValid(GetMaster(oValen)) == FALSE)
    {
        ChangeToStandardFaction(oValen, STANDARD_FACTION_COMMONER);
        AssignCommand(oValen, JumpToLocation(lSeer));
        int nMaxLevel = 15;
        int nValLevel = GetHitDice(oValen);
        while (nValLevel <= nMaxLevel && nValLevel != 0)
        {
            nValLevel = LevelUpHenchman(oValen, CLASS_TYPE_INVALID, TRUE);
        }
    }
    //if the PC has set up the Deva to defend the Seer - spawn her in here.
    if (GetLocalInt(GetModule(), "X2_Battle2DevaWithSeer") == 1)
    {
        location lDeva = GetLocation(GetWaypointByTag("bat2wp_devastart"));
        object oDeva = CreateObject(OBJECT_TYPE_CREATURE, "q2dlavoera", lDeva);

    }

    //if the PC has set up the Golems to defend the Seer - spawn them in here
    if (GetLocalInt(GetModule(), "X2_Battle2Golem1WithSeer") == 1)
    {
        location lSpawn = GetLocation(GetWaypointByTag("bat2wp_devastart"));
        object oGolem = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bat_fleshgol", lSpawn);
    }
    if (GetLocalInt(GetModule(), "X2_Battle2Golem2WithSeer") == 1)
    {
        location lSpawn = GetLocation(GetWaypointByTag("bat2wp_devastart"));
        object oGolem = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bat_silvgol", lSpawn);
    }


}

