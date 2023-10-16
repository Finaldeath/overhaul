//::///////////////////////////////////////////////
//:: Name bat1_spawndef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in the Defenders for Battle 1 (battle at the gates)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
#include "x2_inc_globals"

void CreateRebelCatapultTeam(int nWaypoint);
//void SetFormation(int nFormation, string szResRef);
void SpawnGroup(int nFormation, string szResRef, string szTarget);
void SpawnDeva();
void SpawnGolems();

void main()
{
    //Set a variable so that the PC can no longer transition out of the area
    SetLocalInt(GetModule(), "X2_Bat1PCNoTransition", 1);

    //Close and lock the gate
    object oGate = GetObjectByTag("q2acitygate");
    AssignCommand(oGate, ActionCloseDoor(oGate));
    SetLocked(oGate, TRUE);


    location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_rebspawn"));

    object oTarget1 = GetWaypointByTag("wp_bat1_rebmoveto1");
    object oTarget2 = GetWaypointByTag("wp_bat1_rebmoveto2");
    object oTarget3 = GetWaypointByTag("wp_bat1_rebmoveto3");
    object oTarget4 = GetWaypointByTag("wp_bat1_rebmoveto4");
    object oTarget5 = GetWaypointByTag("wp_bat1_rebcleric1");
    string szTarget1 = "wp_bat1_rebmoveto1_";
    string szTarget2 = "wp_bat1_rebmoveto2_";
    string szTarget3 = "wp_bat1_rebmoveto3_";
    string szTarget4 = "wp_bat1_rebmoveto4_";
    string szSword = "q2abat1reb1";
    string szMarksman = "q2abat1reb2";
    string szCleric = "q2abat1reb3";
    SpawnGroup(1, szSword, szTarget1);
    SpawnGroup(2, szSword, szTarget2);
    SpawnGroup(3, szMarksman, szTarget3);
    SpawnGroup(4, szMarksman, szTarget4);

    DelayCommand(10.0, SpawnDeva());
    DelayCommand(15.0, SpawnGolems());


    CreateRebelCatapultTeam(1);
    CreateRebelCatapultTeam(2);
    CreateRebelCatapultTeam(3);
    CreateRebelCleric(szCleric, lSpawn, oTarget5);
    CreateRebelCleric(szCleric, lSpawn, oTarget5);
    //Keep track of formation count for dynamic squad creation
    SetLocalInt(GetModule(), "X2_Q2ABattle1RebFormCount", 5);

}
void CreateRebelCatapultTeam(int nWaypoint)
{
    location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_rebcatspawn" + IntToString(nWaypoint)));
    CreateObject(OBJECT_TYPE_PLACEABLE, "q2arebcatapult", lSpawn);
    CreateObject(OBJECT_TYPE_CREATURE, "q2a_rebcatteam", lSpawn);
}

void SpawnGroup(int nFormation, string szResRef, string szTarget)
{
    location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_rebspawn"));
    int nCount;
    object oCreature;
    effect eVis = EffectVisualEffect(VFX_DUR_FLAG_GOLD);
    object oHelm;
    object oTarget;
    for (nCount = 1; nCount < 6; nCount++)
    {
        oCreature = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, FALSE, szResRef + IntToString(nFormation) + IntToString(nCount));
        if (nCount == 1)
        {
            SetLocalInt(oCreature, "nLeader", 1);

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oCreature);
            oHelm = CreateItemOnObject("q2arebleadhelm", oCreature);
            SetDroppableFlag(oHelm, FALSE);
            AssignCommand(oCreature, ActionEquipItem(oHelm, INVENTORY_SLOT_HEAD));//ADVANCE
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
void SpawnDeva()
{
    if (GetGlobalInt("x2_plot_deva_help") == 1 && GetLocalInt(GetModule(), "nDevaPlacedCount") == 0)
    {
        SetLocalInt(GetModule(), "nDevaPlacedCount", 1);
        location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_rebspawn"));
        object oDeva = CreateObject(OBJECT_TYPE_CREATURE, "q2dlavoera", lSpawn);
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oDeva);
        AssignCommand(oDeva, ActionMoveToObject(oPC, FALSE, 3.0));
    }
}

void SpawnGolems()
{
    if ((GetGlobalInt("x2_plot_golem1_in") == 1 ||
        GetGlobalInt("x2_plot_golem2_in") == 1 )&& GetLocalInt(GetModule(), "nGolemsPlacedCount") == 0)
    {
        SetLocalInt(GetModule(), "nGolemsPlacedCount", 1);

        location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_rebspawn"));
        object oGolem1 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bat_fleshgol", lSpawn);
        object oGolem2 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bat_silvgol", lSpawn);
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oGolem1);

        AssignCommand(oGolem1, ActionMoveToObject(oPC, FALSE, 6.0));
        DelayCommand(2.5, AssignCommand(oGolem2, ActionMoveToObject(oPC, FALSE, 10.0)));
    }
}
