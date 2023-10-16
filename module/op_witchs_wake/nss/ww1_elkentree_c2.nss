//::///////////////////////////////////////////////
//:: Witchwork 1: Elkentree, Raven Found condition
//:: WW1_Elkentree_C2.nsss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if someone has already found the
     Raven.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bRavenFound = GetLocalInt(OBJECT_SELF, "bRavenFound");

    if (bRavenFound == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
