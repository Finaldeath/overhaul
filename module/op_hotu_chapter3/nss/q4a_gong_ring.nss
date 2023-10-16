#include "nw_i0_plot"
void main()
{
    //Journal Entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("q4a_gargs", 55, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 124;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

}
