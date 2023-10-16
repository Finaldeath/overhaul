#include "NW_I0_Generic"
void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q4FCallikAngry"))
    {
        AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
        AdjustReputation(OBJECT_SELF,GetPCSpeaker(),-100);
        //DetermineCombatRound();
        //SpeakString("NW_CALL_TO_ARMS",TALKVOLUME_SILENT_SHOUT);
        SignalEvent(OBJECT_SELF,EventUserDefined(490));
    }
}
