//::///////////////////////////////////////////////
//:: Name q2d3_open_chest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mindflayers wake up if you open the chest
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 16/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oArea = GetObjectByTag("q2dchambers");
    if (GetLocalInt(oArea, "nAwakened") == 1)
            return;

    SetLocalInt(oArea, "nAwakened", 1);

    object oDoor;
    object oMindflayer;
    object oPC = GetLastOpenedBy();

    int nDoor;
    for (nDoor = 1; nDoor < 6; nDoor++)
    {
        oDoor = GetObjectByTag("q2d3_door" + IntToString(nDoor));
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        oMindflayer = GetObjectByTag("q2d_ill_sleep" + IntToString(nDoor));
        SetLocalInt(oMindflayer, "nAwakened", 1);
        ChangeToStandardFaction(oMindflayer, STANDARD_FACTION_HOSTILE);
        AssignCommand(oMindflayer, ActionMoveToObject(oPC, TRUE, 3.0));
        DelayCommand(2.0, AssignCommand(oMindflayer, DetermineCombatRound()));
    }
}
