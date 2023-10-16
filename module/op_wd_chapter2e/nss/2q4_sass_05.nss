//::///////////////////////////////////////////////
//:: Sass Setup
//:: 2Q4_SASS_05
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the random number.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 3, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nRand = GetLocalInt(OBJECT_SELF, "NW_2Q4_BELA_SASS");
    if(nRand == 4)
    {
        return TRUE;
    }
    return FALSE;
}
