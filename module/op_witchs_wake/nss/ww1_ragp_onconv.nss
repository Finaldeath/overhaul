//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker OnConversation
//:: WW1_Ragp_OnConv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mild variant of NW_C2_DEFAULT4 that ensures
    that the Ragpicker is currently commandable.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 24, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();
    object oIntruder;

    while (GetCommandable(OBJECT_SELF) == FALSE)
    {
        SetCommandable(TRUE);
    }

    if (nMatch == -1 && GetCommandable(OBJECT_SELF))
    {
        ClearAllActions();
        BeginConversation();

/**///////Witchwork: Inform the DM that a Player is engaging in conversation.
/**/    if (GetIsPC(oShouter) == TRUE)
/**/    {
/**/        string sCharName = GetName(oShouter);
/**/        string sPlayerName = GetPCPlayerName(oShouter);
/**/        string sNPCName = GetName(OBJECT_SELF);
/**/        string sNPCTag = GetTag(OBJECT_SELF);
/**/
/**/        SendMessageToAllDMs(sCharName+" ("+sPlayerName+") has engaged "+
/**/                            sNPCName+" ("+sNPCTag+") in conversation.");
/**/    }
    }
    else
    if(nMatch != -1 && GetIsObjectValid(oShouter) && !GetIsPC(oShouter) && GetIsFriend(oShouter))
    {
        if(nMatch == 4)
        {
            oIntruder = GetLocalObject(oShouter, "NW_BLOCKER_INTRUDER");
        }
        else if (nMatch == 5)
        {
            oIntruder = GetLastHostileActor(oShouter);
            if(!GetIsObjectValid(oIntruder))
            {
                oIntruder = GetAttemptedAttackTarget();
                if(!GetIsObjectValid(oIntruder))
                {
                    oIntruder = GetAttemptedSpellTarget();
                    if(!GetIsObjectValid(oIntruder))
                    {
                        oIntruder = OBJECT_INVALID;
                    }
                }
            }
        }
        RespondToShout(oShouter, nMatch, oIntruder);
    }


    if(GetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1004));
    }
}
