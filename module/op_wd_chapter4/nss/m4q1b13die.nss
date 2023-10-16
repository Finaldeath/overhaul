//::///////////////////////////////////////////////
//:: M4Q1B13Die.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   When this wizard dies the one north golem
   will collapse
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetPlotFlag(GetNearestObjectByTag("M4LightNode1"), FALSE);
    DestroyObject(GetNearestObjectByTag("M4LightNode1"));
    SetPlotFlag(GetNearestObjectByTag("M4LightNode2"), FALSE);
    DestroyObject(GetNearestObjectByTag("M4LightNode2"));
    SetPlotFlag(GetNearestObjectByTag("M4LightNode3"), FALSE);
    DestroyObject(GetNearestObjectByTag("M4LightNode3"));

    object oKiller = GetLastKiller();
    // * if a henchman did the killing, give the master the journal entry
    object oMaster = GetMaster(GetLastKiller());
    if (GetIsObjectValid(oMaster) == TRUE)
    {
      oKiller = oMaster;
    }

    RewardXP("M4Q01_SIEGE",26,oKiller);
//    SetLocalInt(GetModule(),"NW_G_M4Q1_WIZNORTHDEAD",1)
    if (!GetIsDead(GetObjectByTag("M4SiegeGolem")))
    {
        SetLocalInt(GetModule(),"NW_G_B13NorthWizard",10);

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
