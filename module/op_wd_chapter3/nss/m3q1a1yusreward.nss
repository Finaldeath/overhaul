//::///////////////////////////////////////////////
//:: Yusam determines and gives reward
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"
#include "nw_i0_plot"

void main()
{
    // * Take Yusam's feather thing
    if (HasYusamToken(GetPCSpeaker()))
    {
        TakeYusamToken(GetPCSpeaker());
    }
    if (CheckCharismaHigh())
    {
        CreateItemOnObject(M3Q2A05YUSAMHIGH, GetPCSpeaker());
    }
    else
    if (CheckCharismaMiddle())
    {
        CreateItemOnObject(M3Q2A05YUSAMMID, GetPCSpeaker());
    }
    if (CheckCharismaLow())
    {
        CreateItemOnObject(M3Q2A05YUSAMLOW, GetPCSpeaker());
    }

  // * reward 100% of xp for plot
  RewardXP("M3Q1_A05_YUSAM", 100, GetPCSpeaker());
  SetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_YUSAMDREAM",1);
}
