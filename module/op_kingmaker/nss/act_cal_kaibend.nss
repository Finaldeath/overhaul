//::///////////////////////////////////////////////
//:: act_cal_kaibend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala bends over.
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
            ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0,6.0));
    }
}
