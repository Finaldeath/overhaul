//::///////////////////////////////////////////////
//:: Heurodis (Action - Attack)
//:: A_HeurodisAttack.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make Heurodis attack.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 26, 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    object oHeurodis = GetObjectByTag("Heurodis");
    //object oPC = GetPCSpeaker();
    SetLocalInt(oHeurodis, "bStopAnimation", TRUE);
    ChangeToStandardFaction(oHeurodis, STANDARD_FACTION_HOSTILE);
    AssignCommand(oHeurodis, DetermineCombatRound());
    //DetermineCombatRound();
    //Give XP to everyone
    int iXP;
    object oPC_XP = GetFirstPC();
    while (oPC_XP != OBJECT_INVALID)
    {
        int bXP = GetLocalInt(oPC_XP, "XP_Main_09");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC_XP, "XP_Main_09", TRUE);
            iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.06);
            GiveXPToCreature(oPC_XP, iXP);
        }
        oPC_XP = GetNextPC();
    }
}
