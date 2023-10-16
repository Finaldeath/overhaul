//::///////////////////////////////////////////////
//:: Name act_q2d3sleep_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All the sleepers awake and attack
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oArea = GetObjectByTag("q2dchambers");
    if (GetLocalInt(oArea, "nAwakened") == 1)
            return;

    SetLocalInt(oArea, "nAwakened", 1);
    SetLocalInt(GetModule(), "X2_Q2DIllithidHostile", 1);
    object oDoor;
    object oMindflayer;
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    int nDoor;
    for (nDoor = 1; nDoor < 6; nDoor++)
    {
        oDoor = GetObjectByTag("q2d3_door" + IntToString(nDoor));
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        oMindflayer = GetObjectByTag("q2d_ill_sleep" + IntToString(nDoor));
        SetLocalInt(oMindflayer, "nAwakened", 1);
        ChangeToStandardFaction(oMindflayer, STANDARD_FACTION_HOSTILE);
        AssignCommand(oMindflayer, DetermineCombatRound());
    }

}
