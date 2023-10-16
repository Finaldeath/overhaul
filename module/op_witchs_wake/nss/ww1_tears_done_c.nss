//::///////////////////////////////////////////////
//:: Witchwork 1: Tears Message Translated Condition
//:: WW1_Tears_Done_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the message has already been
     translated by someone.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTranslated = GetLocalInt(OBJECT_SELF, "bTranslated");

    if (bTranslated == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
