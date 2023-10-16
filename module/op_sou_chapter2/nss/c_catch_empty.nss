//::///////////////////////////////////////////////
//:: Catching the Wise Wind (Condition - Empty)
//:: C_Catch_Empty.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet
     written a story.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 30, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sMap = GetLocalString(GetArea(OBJECT_SELF), "sWiseWindMap");
    if (sMap == "")
    {
        return TRUE;
    }
    return FALSE;
}
