//Valen Romance has been forced through use of True Name
#include "nw_i0_plot"
void main()
{
    //Flag his romance variable to indicate that it's been forced
    SetLocalInt(GetModule(), "iValenRomance", 3);

    //Journal Entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Valen", 50, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 206;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
