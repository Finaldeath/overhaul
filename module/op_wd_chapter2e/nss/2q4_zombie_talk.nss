//::///////////////////////////////////////////////
//:: Zombie Talk
//:: 2q4_Zombie_Talk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Random chance of dialogue from the zombie
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


int StartingConditional()
{
    if(d100() > 90)
    {
        return TRUE;
    }
    return FALSE;
}