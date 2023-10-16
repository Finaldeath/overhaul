//::///////////////////////////////////////////////
//:: Name act_q2a3fight_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The two groups of nobels disperse.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 27/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Reward Good PCs with minor XP
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    if (GetLocalInt(oArea, "nBarFightDone") == 1)
        return;

    SetLocalInt(oArea, "nBarFightDone", 1);

    if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD)
        Reward_2daXP(oPC, XP_MEDIUM_LOW, FALSE);


    //Evil doers will leave by the front door.
    object oEvil1 = GetObjectByTag("q2a3evilguard1");
    object oEvil2 = GetObjectByTag("q2a3evilguard2");
    object oEvil3 = GetObjectByTag("q2a3evilguard3");
    object oGood1 = GetObjectByTag("q2a3guard1");
    object oGood2 = GetObjectByTag("q2a3guard2");

    object oDoor = GetObjectByTag("bat2_seertarget");
    AssignCommand(oEvil1, ActionMoveToObject(oDoor));
    DestroyObject(oEvil1, 5.0);
    DelayCommand(0.5, SetCommandable(FALSE, oEvil1));

    AssignCommand(oEvil2, ActionMoveToObject(oDoor));
    DestroyObject(oEvil2, 5.0);
    DelayCommand(0.5, SetCommandable(FALSE, oEvil2));

    AssignCommand(oEvil3, ActionMoveToObject(oDoor));
    DestroyObject(oEvil3, 5.0);
    DelayCommand(0.5, SetCommandable(FALSE, oEvil3));


}
