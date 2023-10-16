//::///////////////////////////////////////////////
//::
//:: act_q2dnath_1
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
//::
//:://////////////////////////////////////////////
//::
//:: Created By: Keith Warner
//:: Created On: August 1/03
//::
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "X2_Q2DNath_Talklevel", GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel") + 1);

}
