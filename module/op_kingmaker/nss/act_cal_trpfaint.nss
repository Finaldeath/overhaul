//::///////////////////////////////////////////////
//:: act_cal_trpfaint
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip faints
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
        AssignCommand(oTrp,
            ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK,1.0,6.0));
    }
}
