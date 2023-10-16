//::///////////////////////////////////////////////
//:: Name q2d_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User Defined Events for Undermountain Level 3
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 24/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void SpawnReinforcements1();
void SpawnReinforcements2();
void SpawnReinforcements3();

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    //Reinforcements for the initial drow ambush
    if (nEvent == 101)
    {
        if (GetLocalInt(OBJECT_SELF, "nDoneEvent101") == 1)
            return;

        SetLocalInt(OBJECT_SELF, "nDoneEvent101", 1);

        object oDoor = GetObjectByTag("q2d_ambushdoor_1");

        DelayCommand(6.0, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
        DelayCommand(6.0, SpawnReinforcements1());
        DelayCommand(10.0, SpawnReinforcements2());
        DelayCommand(14.0, SpawnReinforcements3());
    }
    //Make the formians and the drow hate each other after the cutscene on Level 3 of Undermountain
    else if (nEvent == 201)
    {
        if (GetLocalInt(OBJECT_SELF, "nDoneEvent201") == 1)
            return;

        SetLocalInt(OBJECT_SELF, "nDoneEvent201", 1);

        //Set the drow to Hostile faction and make them hostile to all formians in the area
        object oTarget;
        object oCreature = GetFirstObjectInArea(OBJECT_SELF);
        {
            while (oCreature != OBJECT_INVALID)
            {
                if (GetStringLeft(GetTag(oCreature), 11) == "q2d_cutdrow")
                {
                    ChangeToStandardFaction(oCreature, STANDARD_FACTION_HOSTILE);
                    DelayCommand(1.0, AssignCommand(oCreature, DetermineCombatRound()));
                }
                else if (GetStringLeft(GetTag(oCreature), 11) == "q2d_cutform")
                {
                    SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, 0, oCreature);
                    oTarget = GetNearestObjectByTag("q2d_cutdrow_guard1");
                    if (GetDistanceBetween(oCreature, oTarget) < 15.0)
                        AssignCommand(oCreature, ActionAttack(oTarget));
                    else
                        AssignCommand(oCreature, ActionMoveToObject(GetObjectByTag("wp_q2d_formian_rallypoint")));
                    DelayCommand(4.0, AssignCommand(oCreature, DetermineCombatRound()));
                }
                oCreature = GetNextObjectInArea(OBJECT_SELF);
            }
        }
    }
}
void SpawnReinforcements1()
{
    object oSpawnPoint = GetWaypointByTag("wp_q2d_ambushdoor_1_spawn");
    object oArcherPost = GetWaypointByTag("wp_q2d_ambush1_post1");

    object oArcher1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowarcher1", GetLocation(oSpawnPoint));
    object oArcher2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowarcher1", GetLocation(oSpawnPoint));
    AssignCommand(oArcher1, ActionMoveToObject(oArcherPost, TRUE));
    AssignCommand(oArcher2, ActionMoveToObject(oArcherPost, TRUE));



}

void SpawnReinforcements2()
{
    object oSpawnPoint = GetWaypointByTag("wp_q2d_ambushdoor_1_spawn");
    object oRoomPost = GetWaypointByTag("wp_q2d_ambush1_post2");
    object oDrow1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowwar1", GetLocation(oSpawnPoint));
    object oDrow2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowwar1", GetLocation(oSpawnPoint));
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oDrow1);

    AssignCommand(oDrow1, ActionMoveToObject(oPC, TRUE, 5.0));
    AssignCommand(oDrow2, ActionMoveToObject(oPC, TRUE, 5.0));



}

void SpawnReinforcements3()
{
    object oSpawnPoint = GetWaypointByTag("wp_q2d_ambushdoor_1_spawn");
    object oRoomPost = GetWaypointByTag("wp_q2d_ambush1_post2");
    object oDrow1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowwiz1", GetLocation(oSpawnPoint));
    object oDrow2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowrogue1", GetLocation(oSpawnPoint));
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oDrow1);

    AssignCommand(oDrow1, ActionMoveToObject(oPC, TRUE, 5.0));
    AssignCommand(oDrow2, ActionMoveToObject(oPC, TRUE, 5.0));



}
