//::///////////////////////////////////////////////
//:: Shadow Servant (Action - Open Store)
//:: A_ShadServ_Store.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Allow the player to view the shadow store.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 28, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    object oStore = GetNearestObjectByTag("ShadowStore");
    gplotAppraiseOpenStore(oStore, oPC);

    //Give the player XP if they haven't already received it.
    int bXP = GetLocalInt(oPC, "XP_Wizard_08");
    if (bXP == FALSE)
    {
        SetLocalInt(oPC, "XP_Wizard_08", TRUE);
        int iXP = FloatToInt(GetJournalQuestExperience("Journ_Wizard_End") * 0.10);
        GiveXPToCreature(oPC, iXP);
    }
}
