//::///////////////////////////////////////////////
//:: act_cal_kaitaunt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala taunts Calibast.
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
        AssignCommand(oKai,
            ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT,1.0));
    }
}
