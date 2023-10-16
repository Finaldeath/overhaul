//::///////////////////////////////////////////////
//:: Name  con_q2craksarc_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return TRUE if Linu has not been raised yet..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 23/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nLinuRaised") == 1)
        return FALSE;
    return TRUE;
}
