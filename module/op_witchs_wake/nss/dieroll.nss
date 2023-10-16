//::///////////////////////////////////////////////
//:: Action Die Roll
//:: DieRoll.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the Die Roll string and the broadcast
    volume, then broadcasts it accordingly.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    string sPlayerName = GetPCPlayerName(oPC);
    string sBroadcast = GetLocalString(oPC, "DiceBagBroadcast");
    int iVolume = GetLocalInt(oPC, "DiceBagVolume");

    switch (iVolume)
    {
        case 0: //LOCAL Broadcast
        {
            SpeakString(sBroadcast, TALKVOLUME_TALK);
        }
        break;

        case 1: //GLOBAL Broadcast
        {
            SpeakString(sBroadcast, TALKVOLUME_SHOUT);
        }
        break;

        case 2: //PRIVATE Broadcast
        {
            SendMessageToPC(oPC, sBroadcast);
        }
        break;
    }

    //Destroy the Dice Bag object
    DestroyObject(OBJECT_SELF);
}
