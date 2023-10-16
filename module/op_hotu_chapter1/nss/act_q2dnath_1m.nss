//::///////////////////////////////////////////////
//::
//:: act_q2dnath_1m
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: Increments the TalkLevel local each time
//::
//::  GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel") == 0)
//::  Explore map for player
//::
//:://////////////////////////////////////////////
//::
//:: Created By: Keith Warner
//:: Created On: August 1/03
//::
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(OBJECT_SELF);
    SetLocalInt(GetModule(), "X2_Q2DNath_Talklevel", GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel") + 1);
    ExploreAreaForPlayer(oArea, oPC);
}
