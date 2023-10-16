//::///////////////////////////////////////////////
//:: Name q2c_ent_drowcamp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set a variable on the PC that they've been in the
    drow camp - if the Formians are not already helping
    the PC - then they never will
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(oPC, "X2_Q2DCentralDrowCamp", 1);
    }
}
