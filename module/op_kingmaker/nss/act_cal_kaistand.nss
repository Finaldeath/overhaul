//::///////////////////////////////////////////////
//:: act_cal_kaistand
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala stands up
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oKai = GetNearestObjectByTag("os_hen_kai");
    if(GetIsObjectValid(oKai))
    {
        AssignCommand(oKai,ClearAllActions());
    }
}
