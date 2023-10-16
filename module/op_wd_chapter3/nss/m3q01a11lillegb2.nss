//::///////////////////////////////////////////////
//:: Take Snow Globe, give Experience Point Reward
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
   if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 1)
   {
       SetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN",3);

   }

   if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 0)
   {
        SetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN",2);


   }
   //ActionTakeItem(GetObjectByTag("M3Q1_A11_LIL_SNO"), GetPCSpeaker());
   object oGlobe = GetItemPossessedBy(GetPCSpeaker(), "M3Q1_A11_LIL_SNO");
   if (GetIsObjectValid(oGlobe) == TRUE)
   {
    DestroyObject(oGlobe);
   }

//   DestroyObject(GetObjectByTag("M3Q1_A11_LIL_SNO"));
   RewardXP("M3Q1_A11_LILLIAN",75,GetPCSpeaker());
   ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DEATH_WARD),OBJECT_SELF);
   CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q1SNOWGLOBESPA",GetLocation(GetObjectByTag("M3Q1SNOWGLOBE")));
   SetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL",1);
   SetLocalInt(OBJECT_SELF,"NW_G_M3Q01PLOTGLOBEONPEDESTAL",1);
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q1A11_SNOWGIVEN",1);
}
