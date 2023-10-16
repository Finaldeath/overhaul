//::///////////////////////////////////////////////
//:: Witch Wake 1: Morrius, On Conversation Abort
//:: WW1_Morr_Abort.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Have him warn the player on Abort.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    string sWarning = "Beware the Night Hag, ye hear? She's not to be trusted.";

    object oVoice = GetNearestObjectByTag("ww1_narrator195", oPC);
    SoundObjectPlay(oVoice);
    DelayCommand(25.0, SoundObjectStop(oVoice));
    SpeakString(sWarning);
    SetLocalInt(oPC, "CONV_MORRIUS_Trust", TRUE);
}
