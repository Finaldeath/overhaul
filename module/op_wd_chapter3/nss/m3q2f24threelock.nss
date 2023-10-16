//::///////////////////////////////////////////////
//:: M3Q2F24ThreeLock.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All three locks remain
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  December
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult = FALSE;
    if (GetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING") == 3)
        iResult = TRUE;
    return iResult;
}

