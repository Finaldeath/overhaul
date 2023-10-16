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
        if(GetLocalInt(OBJECT_SELF, "ALARM") == 1 && !GetIsInCombat(OBJECT_SELF))
        {
            object oWP = GetWaypointByTag("q3b_wp_alarm");
            ClearAllActions();
            ActionMoveToObject(oWP, TRUE, 7.0);
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        int nRand = Random(16);
        int nVoice;
        if(nRand == 0) nVoice = VOICE_CHAT_BATTLECRY1;
        else if(nRand == 1) nVoice = VOICE_CHAT_BATTLECRY2;
        else if(nRand == 2) nVoice = VOICE_CHAT_BATTLECRY3;
        else if(nRand == 3) nVoice =  VOICE_CHAT_TAUNT;
        if(nRand <= 3)
            PlayVoiceChat(nVoice, OBJECT_SELF);
    }
    else if(nUser == 1004) // ON DIALOGUE
    {
        //PlayVoiceChat(VOICE_CHAT_THREATEN, OBJECT_SELF);
    }
    else if(nUser == 1005) // ATTACKED
    {
        // Disable the gong cutscene
        SetLocalInt(GetModule(), "q3_NoCutscene", 1);
    }
    else if(nUser == 1006) // DAMAGED
    {
        // Disable the gong cutscene
        SetLocalInt(GetModule(), "q3_NoCutscene", 1);
    }
    else if(nUser == 1007) // DEATH
    {
        // Disable the gong cutscene
        SetLocalInt(GetModule(), "q3_NoCutscene", 1);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 101) // alarm
    {
        float fDelay = GetLocalFloat(GetModule(), "Q3_ALARM_DELAY");
        fDelay += 3.0;
        SetLocalFloat(GetModule(), "Q3_ALARM_DELAY", fDelay);
        object oWP = GetWaypointByTag("q3b_wp_alarm");
        ClearAllActions();
        DelayCommand(fDelay, ActionMoveToObject(oWP, TRUE, 5.0));
        DelayCommand(fDelay, SetLocalInt(OBJECT_SELF, "ALARM", 1));
    }

}


