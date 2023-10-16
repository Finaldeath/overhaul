//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed, Corpse Form
//:: WW1_Ahmed_Corpse.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Ahmed is now in Corpse form
     (as opposed to Corpse-on-Pike form).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 15, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sTag = GetTag(OBJECT_SELF);

    if (sTag == "AhmedCorpse")
    {
        return TRUE;
    }
    return FALSE;
}
