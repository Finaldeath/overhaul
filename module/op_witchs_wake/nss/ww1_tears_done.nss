//::///////////////////////////////////////////////
//:: Witchwork 1: Tears Message Translated
//:: WW1_Tears_Done.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the local indicating that the message
     has now been translated (future players won't
     have to retranslate). Also flags the well
     as being descendable.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 28, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "bTranslated", TRUE);
    SetLocalInt(GetModule(), "bWellActive", TRUE);
    SendMessageToAllDMs("The Old Man's Well is now ACTIVE, allowing players "+
                        "to enter Brogan's Tears.");
}
