//::///////////////////////////////////////////////
//:: Name: OnEnter Expose Map
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
}
