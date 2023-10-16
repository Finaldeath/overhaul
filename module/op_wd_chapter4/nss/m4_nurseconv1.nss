//::///////////////////////////////////////////////
//:: M4_NURSECONV1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rolls the dice to see which conversation file will
    show.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nRand = d4();
    SetLocalInt(OBJECT_SELF,"NW_NURSECONV",nRand);
    if(nRand==1)
    {
        return TRUE;
    }
    return FALSE;
}
