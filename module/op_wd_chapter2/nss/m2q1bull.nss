//::///////////////////////////////////////////////
//:: SetListeningPatterns
//:: NW_C2_DEFAULT4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    by the generic script after dialogue or a
    shout is initiated.
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

    SetLocalInt(OBJECT_SELF,"NW_L_ClickCount",GetLocalInt(OBJECT_SELF,"NW_L_ClickCount") + 1);

    if (GetLocalInt(OBJECT_SELF,"NW_L_ClickCount") == 25)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_ClickCount",0);
        SignalEvent(OBJECT_SELF,EventUserDefined(100));
    }
    if (nMatch == -1)
    {
        ClearAllActions();
        BeginConversation();
    }
    else if(GetIsObjectValid(oShouter) && !GetIsPC(oShouter) && GetIsFriend(oShouter))
    {
        if(nMatch == 4)
        {
            oIntruder = GetLocalObject(oShouter, "NW_BLOCKER_INTRUDER");
        }
        else if (nMatch == 5)
        {
            oIntruder = GetLastAttacker(oShouter);
        }
        RespondToShout(oShouter, nMatch, oIntruder);
        if(GetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT))
        {
            SignalEvent(OBJECT_SELF, EventUserDefined(1004));
        }
    }
}
