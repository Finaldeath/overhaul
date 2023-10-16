//::///////////////////////////////////////////////
//:: q2_smith_havesho
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns True if the smith mentioned
    that she has a shop.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "X2_TOLDSHOP") == TRUE)
    {
        return TRUE;
    }
    return FALSE;

}
