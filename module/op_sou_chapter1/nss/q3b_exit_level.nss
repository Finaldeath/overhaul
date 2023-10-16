//::///////////////////////////////////////////////
//:: Name: q3b_exit_level
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Keep track of the number of PCs in the area to
    determine if Vfx should fire on pedestals
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 4/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC))
    {
        SetLocalInt(GetModule(), "X1_Q3B_NUMPC", GetLocalInt(GetModule(), "X1_Q3B_NUMPC") - 1);

    }
}
