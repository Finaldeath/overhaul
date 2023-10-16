//::///////////////////////////////////////////////
//:: M3Q2F24MoreLock.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if there is at least one lock remaining
    otherwise it says the door opens (and it does)
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  December
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult = FALSE;
    if (GetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING") >= 1)
        iResult = TRUE;
    return iResult;
}
