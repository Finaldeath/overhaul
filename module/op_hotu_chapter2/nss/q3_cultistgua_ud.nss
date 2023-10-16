//::///////////////////////////////////////////////
//:: Name x2_def_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        object oArmand = GetNearestObjectByTag("q3_armand");
        SignalEvent(oArmand, EventUserDefined(101));
        int nRand = Random(12);
        int nVoice;
        if(nRand == 0) nVoice = VOICE_CHAT_BATTLECRY1;
        else if(nRand == 1) nVoice = VOICE_CHAT_BATTLECRY2;
        else if(nRand == 2) nVoice = VOICE_CHAT_BATTLECRY3;
        else if(nRand == 3) nVoice = VOICE_CHAT_ATTACK;
        else if(nRand == 4) nVoice =  VOICE_CHAT_TAUNT;
        PlayVoiceChat(nVoice, OBJECT_SELF);
    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }


}


