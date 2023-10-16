//::///////////////////////////////////////////////
//:: Witchwork 1: Return to Battlefield Trigger Message
//:: WW_Msg_Return.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Informs the player when they click on the
     transition trigger that there's no point in
     going back.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 15, 2002
//:://////////////////////////////////////////////

void main()
{
    object oClicker = GetClickingObject();
    string sPlayerID = GetPCPlayerName(oClicker) + GetName(oClicker);
    int bSeenOnce = GetLocalInt(OBJECT_SELF, sPlayerID+"SeenOnce");
    string sString = "You look back through the pass. There is nothing left "+
                     "for you there. Not even memories.";
    object oArea = GetArea(OBJECT_SELF);
    int bSound = GetLocalInt(oArea, "bSound");

    if (GetIsPC(oClicker) == TRUE &&
        bSeenOnce == FALSE)
    {
        //Only fire if no other sounds are playing.
        if (bSound == FALSE)
        {
            //Flag the Sound variable.
            SetLocalInt(oArea, "bSound", TRUE);

            //Play GUI sound
            object oVoice = GetNearestObjectByTag("ww1_narrator181", oClicker);
            SoundObjectPlay(oVoice);
            DelayCommand(25.0, SoundObjectStop(oVoice));

            //Remove the Sound variable once the sound is done
            DelayCommand(5.0, SetLocalInt(oArea, "bSound", FALSE));

            //Have the Player whisper the message to themselves.
            AssignCommand(oClicker, SpeakString(sString, TALKVOLUME_WHISPER));

            //Flag the player as having seen the message.
            SetLocalInt(OBJECT_SELF, sPlayerID+"SeenOnce", TRUE);
        }
    }
}
