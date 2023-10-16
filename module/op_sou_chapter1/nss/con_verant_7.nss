//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if Piper is not dealt with.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 3, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_PIPERQUEST") <80
        && GetIsObjectValid(GetObjectByTag("q1gpiper")))
        return TRUE;
    return FALSE;
}
