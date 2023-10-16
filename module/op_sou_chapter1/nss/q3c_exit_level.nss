//::///////////////////////////////////////////////
//:: Name: q3c_exit_level
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Keep track of the number of PCs in the area to
    determine if Jnah should rest
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: March 31/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC))
    {
        SetLocalInt(GetModule(), "X1_Q3C_NUMPC", GetLocalInt(GetModule(), "X1_Q3C_NUMPC") - 1);
        if (GetLocalInt(GetModule(), "X1_Q3C_NUMPC") < 1)
        {
            //If there are no PCs on this level - Jnah can rest..
            object oJnah = GetObjectByTag("Q3_JNAH");
            AssignCommand(oJnah, ClearAllActions(TRUE));
            AssignCommand(oJnah, ActionRest());
        }
    }
}
