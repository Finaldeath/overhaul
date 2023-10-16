//::///////////////////////////////////////////////
//:: Normal Reward, Star Saphire
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
  RewardGP(3000,GetPCSpeaker());
  RewardXP("M3Q1_A09_Hush",100,GetPCSpeaker());
  ActionTakeItem(GetObjectByTag("M3Q1_A11_LIL_STA"),GetPCSpeaker());
  DestroyObject(GetObjectByTag("M3Q1_A11_LIL_STA"));
  SetLocalInt(OBJECT_SELF,"StarSapphire",99);
  SetLocalObject(OBJECT_SELF,"StarSapphirePC",GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_STARFOUND",1);
}

