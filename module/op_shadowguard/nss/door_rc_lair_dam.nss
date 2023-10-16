//::///////////////////////////////////////////////
//:: General Treasure Spawn Script
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in general purpose treasure, usable
    by all classes.
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   February 26 2001
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"

void main()

{
    if (GetPlotFlag(OBJECT_SELF) == FALSE)
    {
        ShoutDisturbed();
    }
}
