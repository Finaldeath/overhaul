//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: x2_cmbtrnd_fairy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calls the end of combat script every round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
void main()
{
    if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
    {
        DetermineSpecialBehavior();
    }
    else if(!GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
    {
       DetermineCombatRound();
    }
    if(GetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1003));
    }
    int nRandomSpeak = Random(5);
    string szSpeak = "";
    switch (nRandomSpeak)
    {
        case 0: szSpeak = GetStringByStrRef(84099);
                break;
        case 1: szSpeak = GetStringByStrRef(84100);
                break;
        case 2:
        case 3:
        case 4: break;
    }
    if (szSpeak != "")
        SpeakString(szSpeak);
}




