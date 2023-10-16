////////////////////////////////////////////////////////////////////////////////////////
// Simple click-talk for a statue. This gives the PC a hint on what they need to do.
//
// Created by: Brad Prince
// 9-13-02
//
////////////////////////////////////////////////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
   object oPC = GetLastUsedBy();

   //SpeakString("[NOT IN STRING EDITOR] This statue has several scratches where its eyes would be. Etched words read, 'What one cannot hear, others cannot see.'");
   SpeakStringByStrRef(85515);
   AddJournalQuestEntry("q4a_gargs", 30, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    int i2daRow = 121;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

}
