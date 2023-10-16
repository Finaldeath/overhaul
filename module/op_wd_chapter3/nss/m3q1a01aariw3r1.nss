//::///////////////////////////////////////////////
//:: Word of Power 3, Reward High Charisma
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
    RewardGP(5000, GetPCSpeaker());
    RewardXP("M3Q1_A01_WORDPOWER",100,GetPCSpeaker());
    // * Makes sure you can't return same word more than once
    SetLocalInt(OBJECT_SELF, GetTag(GetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD")), TRUE);

  //  ActionTakeItem(GetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD"), GetPCSpeaker());
    DestroyObject(GetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD"));


    SetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD", OBJECT_INVALID);
    SetLocalObject(OBJECT_SELF,"NW_L_M3Q01TALKPARTYLEADER", GetPCSpeaker());
    SetCustomToken(100,GetName(GetPCSpeaker()));
    // * sets the local so the final dialog option will appear
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES",4);
    SetLocalInt(GetModule(),"NW_G_CHAPTER3OVER",1);
}
