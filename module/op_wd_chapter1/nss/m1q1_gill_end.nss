#include "NW_I0_Plot"

void main()
{
    object oPC = GetPCSpeaker();
    int iGoodState = GetLocalInt(GetModule(),"nw_g_m1q1oleffstate");
    int iEvilState = GetLocalInt(GetModule(),"nw_g_m1q1_Giles");

    //3 total, Oleff has some
    if (iGoodState == 80)
    {
        //Finished, some good, some bad
        AddJournalQuestEntry("m1q1_gilles", 50, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1_Giles", 50);
    }
    //3 total, Oleff has all
    if (iGoodState == 60)
    {
        //Finished, all bad
        AddJournalQuestEntry("m1q1_gilles", 60, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1_Giles", 60);
    }

}
