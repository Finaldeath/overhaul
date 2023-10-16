//::///////////////////////////////////////////////
//:: M2Q2A_NSIGN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This code makes the sign give north directions.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 27, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{

    if (GetTag(OBJECT_SELF) == "M2Q2A_SIGNPOSTX2")
    {
        return TRUE;
    }

    return FALSE;
}

