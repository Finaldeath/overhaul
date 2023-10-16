//::///////////////////////////////////////////////
//:: Witchwork 1: Tears Message Not Translated
//:: WW1_Tears_Undone.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the Well as now being activated and
     flags the player as being unable to
     re-attempt the translation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "bFailedTranslation", TRUE);
    SetLocalInt(GetModule(), "bWellActive", TRUE);
    SendMessageToAllDMs("The Old Man's Well is now ACTIVE, allowing players "+
                        "to enter Brogan's Tears.");
}
