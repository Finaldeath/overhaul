//::///////////////////////////////////////////////
//:: Word of Power 2, Reward Low Charisma
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
    RewardGP(2500, GetPCSpeaker());
//    ActionTakeItem(GetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD"), GetPCSpeaker());
    DestroyObject(GetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD"));

    SetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD", OBJECT_INVALID);

    SetLocalObject(OBJECT_SELF,"NW_L_M3Q01TALKPARTYLEADER", GetPCSpeaker());
    SetCustomToken(100,GetName(GetPCSpeaker()));
    RewardXP("M3Q1_A01_WORDPOWER",100,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES",GetLocalInt(OBJECT_SELF,"L_TALKTIMES") + 1);
}
