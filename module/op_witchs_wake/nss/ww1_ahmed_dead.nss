//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed's Dead
//:: WW1_Ahmed_Dead.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Ahmed is already dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 27, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArea = GetArea(OBJECT_SELF);
    string sArea = GetTag(oArea);

    if(sArea == "PlayerAwakes")
    {
        return TRUE;
    }
    return FALSE;
}
