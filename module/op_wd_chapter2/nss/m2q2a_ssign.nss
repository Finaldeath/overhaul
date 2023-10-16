//::///////////////////////////////////////////////
//:: M2Q2A_SSIGN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This code makes the sign give south directions.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 27, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{

    if (GetTag(OBJECT_SELF) == "M2Q2A_SIGNPOSTX1")
    {
        return TRUE;
    }

    return FALSE;
}

