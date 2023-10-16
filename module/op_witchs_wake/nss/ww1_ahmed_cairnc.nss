//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed, Cairn Form
//:: WW1_Ahmed_CairnC.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Ahmed is now in Cairn form
     (as opposed to Corpse-on-Pike form or Corpse
     form).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 15, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sTag = GetTag(OBJECT_SELF);

    if (sTag == "Cairn")
    {
        return TRUE;
    }
    return FALSE;
}
