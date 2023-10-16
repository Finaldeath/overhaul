//::///////////////////////////////////////////////
//:: m2q3G Mayor Mobley Condition Script #1
//:: m2q3G_MayorC1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ensures that he is initiating this line with
    himself.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetIsObjectValid(oPC) == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
