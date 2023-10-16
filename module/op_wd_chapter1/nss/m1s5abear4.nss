#include "NW_I0_GENERIC"

void main()
{
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();
    object oIntruder;
    if ( nMatch == -1 &&
         (GetLevelByClass(CLASS_TYPE_DRUID,oShouter) > 0 ||
          GetLevelByClass(CLASS_TYPE_RANGER,oShouter) > 0 ||
          GetIsObjectValid(GetItemPossessedBy(oShouter,"M1S3Fetish")) ) )
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
