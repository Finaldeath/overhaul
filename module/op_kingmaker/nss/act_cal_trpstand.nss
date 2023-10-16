//::///////////////////////////////////////////////
//:: act_cal_trpstand
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip stands up
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oTrp = GetNearestObjectByTag("os_hen_trp");
    if(GetIsObjectValid(oTrp))
    {
        AssignCommand(oTrp,ClearAllActions());
    }
}
