//::///////////////////////////////////////////////
//:: Name q2b_dist_skbones
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Disturb of the Skeleton King's bones, all
    other Skeleton Kings will go hostile and attack
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 16/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        if (GetLocalInt(GetModule(), "X2_Q2BSkelKingsHostile") == 1)
            return;
        SetLocalInt(GetModule(), "X2_Q2BSkelKingsHostile", 1);
        object oKing1 = GetObjectByTag("q2bsk_1");
        object oKing2 = GetObjectByTag("q2bsk_2");
        object oKing3 = GetObjectByTag("q2bsk_3");
        object oKing5 = GetObjectByTag("q2bsk_5");
        object oKing6 = GetObjectByTag("q2bsk_6");
        object oKing7 = GetObjectByTag("q2bsk_7");
        object oKing9 = GetObjectByTag("q2bsk_9");

        object oPC = GetLastDisturbed();

        if (GetIsObjectValid(oKing1) == TRUE)
        {
            ChangeToStandardFaction(oKing1, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing1, ActionMoveToObject(oPC));
            AssignCommand(oKing1, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing2) == TRUE)
        {
            ChangeToStandardFaction(oKing2, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing2, ActionMoveToObject(oPC));
            AssignCommand(oKing2, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing3) == TRUE)
        {
            ChangeToStandardFaction(oKing3, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing3, ActionMoveToObject(oPC));
            AssignCommand(oKing3, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing5) == TRUE)
        {
            ChangeToStandardFaction(oKing5, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing5, ActionMoveToObject(oPC));
            AssignCommand(oKing5, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing6) == TRUE)
        {
            ChangeToStandardFaction(oKing6, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing6, ActionMoveToObject(oPC));
            AssignCommand(oKing6, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing7) == TRUE)
        {
            ChangeToStandardFaction(oKing7, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing7, ActionMoveToObject(oPC));
            AssignCommand(oKing7, DetermineCombatRound());
        }
        if (GetIsObjectValid(oKing9) == TRUE)
        {
            ChangeToStandardFaction(oKing9, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing9, ActionMoveToObject(oPC));
            AssignCommand(oKing9, DetermineCombatRound());
        }

        //Close and lock the room doors
        object oDoor1 = GetObjectByTag("q2bskdoor1");
        object oDoor2 = GetObjectByTag("q2bskdoor2");
        AssignCommand(oDoor1, ActionCloseDoor(oDoor1));
        AssignCommand(oDoor2, ActionCloseDoor(oDoor2));
        SetLocked(oDoor1, TRUE);
        SetLocked(oDoor2, TRUE);
        PlaySound("as_cv_brickscrp2");
    }


}
