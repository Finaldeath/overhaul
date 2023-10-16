//::///////////////////////////////////////////////
//:: Guards Cheer
//:: act_dyl_cheerpc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guards cheer for the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oGuard1 = GetObjectByTag("q2_militiaguard");
    AssignCommand(oGuard1,ClearAllActions());
    AssignCommand(oGuard1,ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
    object oGuard2;
    int nCount;
    for(nCount = 0; nCount < 4; nCount++)
    {
        oGuard2 = GetObjectByTag("q2_woundedguard",nCount);
        AssignCommand(oGuard2,ClearAllActions());
        AssignCommand(oGuard2,ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3));
    }
}
