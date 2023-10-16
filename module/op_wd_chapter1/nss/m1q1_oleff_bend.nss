#include "NW_I0_Plot"

void main()
{
    object oPC = GetPCSpeaker();
    int iGoodState = GetLocalInt(GetModule(),"nw_g_m1q1oleffstate");
    int iEvilState = GetLocalInt(GetModule(),"nw_g_m1q1_Giles");

    //3 total, Giles has some
    if (iEvilState == 50)
    {
        //Finished, some good, some bad
        AddJournalQuestEntry("m1q1_Never", 80, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1oleffstate", 80);
    }
    //3 total, Giles has all
    if (iEvilState == 40)
    {
        //Finished, all bad
        AddJournalQuestEntry("m1q1_Never", 90, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1oleffstate", 90);
    }

}
