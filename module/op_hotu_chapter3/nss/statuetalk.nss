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

   //SpeakString("[NOT IN STRING EDITOR] Etched words read, 'Stone to stone, the stone turns. Lightning to lightning, the lightning fades.'");
   SpeakStringByStrRef(85514);
   AddJournalQuestEntry("q4a_gargs", 10, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 119;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

}
