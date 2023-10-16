//::///////////////////////////////////////////////
//:: Name con_q1aayala_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if the local location (X1_DEATHPLACE)
    has been set yet on the PC
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:   Feb 19/03
//:://////////////////////////////////////////////

int GetLocationValid(location lLocation);

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocationValid(GetLocalLocation(oPC, "X1_DEATHPLACE")) == TRUE)
        return TRUE;
    return FALSE;
}

int GetLocationValid(location lLocation)
{
    object oArea = GetAreaFromLocation(lLocation);
    if (oArea != OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
