//::///////////////////////////////////////////////
//:: Name: OnEnter Expose Map
//:: q2a1_enter_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Expose the map of the area to the PC when the enter
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 7/02
//:://////////////////////////////////////////////


void main()
{
   object oPC = GetEnteringObject();
   if (GetIsPC(oPC) && GetLocalInt(oPC, "nWaterdeepMap") != 1)
   {
        SetLocalInt(oPC, "nWaterdeepMap", 1);
        ExploreAreaForPlayer(GetArea(oPC), oPC);
   }
   //Remove the Immortal Effect from any PCs entering the city
   if (GetIsPC(oPC) == TRUE)
   {
        SetImmortal(oPC, FALSE);
    }
}
