//::///////////////////////////////////////////////
//:: M3Q1A_3PM
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if it's 3 p.m.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetTimeHour()==15)
    {
        return TRUE;
    }
    return FALSE;
}
