//::///////////////////////////////////////////////
//:: Witch Wake 1: Caldrian, No Ghost
//:: WW1_Cald_NoGhost.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Mine ghost has not yet
     spawned in.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 30, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bGhost = GetLocalInt(OBJECT_SELF, "bGhostSpawned");

    if (bGhost == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
