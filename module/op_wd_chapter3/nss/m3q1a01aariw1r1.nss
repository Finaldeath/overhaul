//::///////////////////////////////////////////////
//:: Word of Power 1, Reward High Charisma
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
    RewardGP(3000, GetPCSpeaker());

        // * Makes sure you can't return same word more than once
    SetLocalInt(OBJECT_SELF, GetTag(GetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD")), TRUE);

    // * PATCH:
    // * Destroy the words of power instead of taking them because they can
    // * be pickpocketed
    DestroyObject(GetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD"));
    SetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD", OBJECT_INVALID);
    SetLocalObject(OBJECT_SELF,"NW_L_M3Q01TALKPARTYLEADER", GetPCSpeaker());
    SetCustomToken(100,GetName(GetPCSpeaker()));
    RewardXP("M3Q1_A01_WORDPOWER",100,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES",GetLocalInt(OBJECT_SELF,"L_TALKTIMES") + 1);
}
