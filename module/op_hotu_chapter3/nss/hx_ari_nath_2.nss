//::///////////////////////////////////////////////
//:: Name hx_ari_nath_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Advance Aribeth and Nathyrra romances to 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "iAribethRomance", 2);
    SetLocalInt(GetModule(), "iNathyrraRomance", 2);

    //Journal Entries
    object oPC = GetPCSpeaker();
    string sPCTrueLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sPCTrueLove == "Nathyrra" ||
        sPCTrueLove == "Aribeth")
    {
        AddJournalQuestEntry("XP2_Name_PlayersLove", 80, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 215;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
}
