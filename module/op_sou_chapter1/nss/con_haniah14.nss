//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks how Haniah feels about the PC.

*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if ((GetLocalInt(oPC,"HANIAHLOVE")< 20 && GetLocalInt(oPC,"HANIAHSPEAK") > 0) || GetLocalInt(GetModule(), "X1_HilltopMayorDead") == 1)
        return TRUE;
    return FALSE;
}
