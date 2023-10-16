//::///////////////////////////////////////////////
//:: M3Q2F24TwoLock.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Two locks remain
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  December
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult = FALSE;
    if (GetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING") == 2)
        iResult = TRUE;
    return iResult;
}


