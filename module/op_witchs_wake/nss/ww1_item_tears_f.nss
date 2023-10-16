//::///////////////////////////////////////////////
//:: Witch's Wake 1: Item Conv, Untranslated Tears Message (Failed)
//:: WW1_Item_Tears_F.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the activating item is the
     Untranslated Tears Message but the player has
     failed to translate it in the past.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "CONV_ActivatingItem");
    object oPC = GetPCSpeaker();
    int bFailed = GetLocalInt(oPC, "bFailedTranslation");


    if (sItem == "ww1_untranslated" &&
        bFailed == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
