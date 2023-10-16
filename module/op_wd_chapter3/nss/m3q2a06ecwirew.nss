//::///////////////////////////////////////////////
//:: Galia, Eckels wife rewards the player
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        300 gp!!!!
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


#include "M3PLOTINCLUDE"
#include "nw_i0_plot"
void main()
{
    TakeEckelNote(GetPCSpeaker());
    RewardGP(300, GetPCSpeaker());
    RewardXP("M3Q2_A10_ECKEL", 50, GetPCSpeaker());
     SetLocalInt(OBJECT_SELF, "NW_L_M3Q02PLOTECKELNOTEDELIVERED",1);
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q2C_GALIANOTE",1);
}
