//::///////////////////////////////////////////////
//:: Name: act_q1dlodar_10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  turn Lodar so he faces the kobold that just spoke
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////
void main()
{
    object oLodar = GetObjectByTag("q1dlodar");
    object oShaman = GetObjectByTag("q1dk_shaman");
    AssignCommand(oLodar, SetFacingPoint(GetPosition(oShaman)));
}
