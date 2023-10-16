//::///////////////////////////////////////////////
//:: Nathyrra, Advance Romance to 2 {Action Script)
//:: H2a_Nath_NameRom.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Advance Nathyrra romance to 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Advance her romance local
    SetLocalInt(GetModule(), "iNathyrraRomance", 3);

    //Journal Entries
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Nathyrra", 50, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 178;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    string sPCTrueLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sPCTrueLove == "Nathyrra")
    {
        AddJournalQuestEntry("XP2_Name_PlayersLove", 110, oPC, TRUE, TRUE, TRUE);
    }
    else if (sPCTrueLove != "" &&
             sPCTrueLove != "Nathyrra")
    {
        AddJournalQuestEntry("XP2_Name_PlayersLove", 100, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 217;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
}
