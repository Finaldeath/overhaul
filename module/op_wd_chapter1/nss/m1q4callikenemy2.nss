#include "NW_I0_Generic"
void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q4FCallikAngry") &&
       GetIsObjectValid(GetPCSpeaker()))
    {
        object oVengaul = GetNearestObjectByTag("m1Q04CVengaul");

        AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
        AdjustReputation(OBJECT_SELF,GetPCSpeaker(),-100);
        AdjustReputation(oVengaul,OBJECT_SELF,-100);
        AdjustReputation(OBJECT_SELF,oVengaul,-100);
        //DetermineCombatRound();
        //SpeakString("NW_CALL_TO_ARMS",TALKVOLUME_SILENT_SHOUT);
        SignalEvent(OBJECT_SELF,EventUserDefined(490));
    }
}

