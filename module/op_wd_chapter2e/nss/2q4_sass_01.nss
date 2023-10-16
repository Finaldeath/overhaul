//::///////////////////////////////////////////////
//:: Sass Setup
//:: 2Q4_SASS_01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Used to generate and store a random number
    on Bela to change the type of sass she
    gives her customers.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 3, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nRand = d6();
    SetLocalInt(OBJECT_SELF, "NW_2Q4_BELA_SASS", nRand);
    return FALSE;
}
