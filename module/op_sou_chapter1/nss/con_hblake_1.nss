//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//Check to see if Blake has his gem on him
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oBlake = GetObjectByTag("q1hblake");
    object oGem = (GetItemPossessedBy(oBlake,"NW_IT_GEM003"));
    if (GetIsObjectValid(oGem))
        return TRUE;
    return FALSE;
}

