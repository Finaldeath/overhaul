//::///////////////////////////////////////////////
//:: M4Q1B13Die2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   When this wizard dies the two south golems
   will collapse
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    DestroyObject(GetObjectByTag("M4LightNode1"));
    DestroyObject(GetObjectByTag("M4LightNode2"));
    DestroyObject(GetObjectByTag("M4LightNode3"));
    object oKiller = GetLastKiller();
    RewardXP("M4Q01_SIEGE",26,oKiller);
    if (!GetIsDead(GetObjectByTag("M4SiegeGolem2")))
    {
        SetLocalInt(GetModule(),"NW_G_B20SouthWizard",10);
        int nGolem =GetLocalInt(GetModule(),"NW_G_GOLEMS_KILLED");
        if(nGolem < 2)
        {
            SetLocalInt(GetModule(),"NW_G_GOLEMS_KILLED",nGolem+1);
            if(GetLocalInt(GetModule(),"NW_G_GOLEMS_KILLED") >= 2)
            {
                AddJournalQuestEntry("M4Q01_SIEGE",15,oKiller);
                if (GetLocalInt(GetModule(),"NW_G_M4Q01_CATAPULTS")>=3)
                {
                    AddJournalQuestEntry("M4Q01_SIEGE",35,GetLastKiller());
                }

            }
        }
    }
}
