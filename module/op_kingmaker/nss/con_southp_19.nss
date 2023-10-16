//::///////////////////////////////////////////////
//:: con_southp_19
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Stiletto is dead
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oStiletto = GetObjectByTag("q2_stiletto");

    if (GetIsDead(oStiletto))
        return TRUE;

    return FALSE;
}
