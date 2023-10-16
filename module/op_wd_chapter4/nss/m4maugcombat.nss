#include "NW_I0_GENERIC"
void main()
{
   // SpeakString("My combat round");
    // * Force raised golems to fight if they somehow got blocked or something
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
    SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);

    // * IF interrupted from performing his golem summoning ritual
    // * he should do it now
    if (GetLocalInt(OBJECT_SELF, "NW_L_MYRITUAL") == 0)
    {    //SpeakString("Ritual");
         ClearAllActions();
         ExecuteScript("m4q01b26maug_1", OBJECT_SELF);
    }
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




}


