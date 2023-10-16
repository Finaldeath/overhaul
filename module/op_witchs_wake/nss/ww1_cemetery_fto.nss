//::///////////////////////////////////////////////
//:: Witchwork 1: Cemetery Gate, OnFailToOpen
//:: WW1_Cemetery_FTO.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Informs the player that they should seek the
     key from the cemetery own (aka the Night Hag)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 17, 2002
//:://////////////////////////////////////////////

void main()
{
    string sMessage = "A stout beam braces this door and a heavy lock secures "+
                      "it. Perhaps the cemetery's owner might have the key.";
    object oVoice = GetNearestObjectByTag("ww1_narrator190");
    SoundObjectPlay(oVoice);
    DelayCommand(25.0, SoundObjectStop(oVoice));

    SpeakString(sMessage);
}
