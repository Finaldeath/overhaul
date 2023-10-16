//::///////////////////////////////////////////////
//:: M3Q2AllSappelC1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sapphira gives a reward
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

void main()
{
    int nValue = 0;

    SetLocalInt(OBJECT_SELF, "NW_L_M3Q2TALKREWARDGIVEN",1);
    if (CheckCharismaHigh() == TRUE)
    {
        nValue = 3000;
    }
    else
    if (CheckCharismaMiddle() == TRUE)
    {
        nValue = 1500;
    }
    else
    if (CheckCharismaLow() == TRUE)
    {
        nValue = 1000;
    }

    GiveValueInGems(GetPCSpeaker(), nValue);
    RewardXP("M3Q02_SAPP",100,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"NW_G_M3Q2H_SAPPHREWARD",1);
}
