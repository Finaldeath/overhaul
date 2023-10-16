//::///////////////////////////////////////////////
//:: Persuasion Reward, Star Saphire, Lillian
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
  RewardGP(1500,GetPCSpeaker());
  RewardXP("M3Q1_A11_LILLIAN",10,GetPCSpeaker());
  ActionTakeItem(GetObjectByTag("M3Q1_A11_LIL_STA"),GetPCSpeaker());
  DestroyObject(GetObjectByTag("M3Q1_A11_LIL_STA"));

    if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 2)
    {
    SetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN",3);
    AddJournalQuestEntry("M3Q1_A11_LILLIAN",30, GetPCSpeaker());
    }

    if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 0)
    {
        SetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN",1);
        AddJournalQuestEntry("M3Q1_A11_LILLIAN",10, GetPCSpeaker());

    }
}

