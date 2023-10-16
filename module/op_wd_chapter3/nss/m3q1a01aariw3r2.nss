//::///////////////////////////////////////////////
//:: Word of Power 3, Reward Medium Charisma
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
    RewardXP("M3Q1_A01_WORDPOWER",100,GetPCSpeaker());
    RewardGP(4500, GetPCSpeaker());
 //   ActionTakeItem(GetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD"), GetPCSpeaker());
     DestroyObject(GetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD"));

    SetLocalObject(OBJECT_SELF,"NW_G_M3Q1L_LASTWORD", OBJECT_INVALID);
    SetLocalObject(OBJECT_SELF,"NW_L_M3Q01TALKPARTYLEADER", GetPCSpeaker());
    SetCustomToken(100,GetName(GetPCSpeaker()));
        // * sets the local so the final dialog option will appear
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES",4);
    SetLocalInt(GetModule(),"NW_G_CHAPTER3OVER",1);
}


