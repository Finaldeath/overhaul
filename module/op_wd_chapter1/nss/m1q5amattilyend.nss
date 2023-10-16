#include "NW_I0_Plot"
void main()
{
   if(GetLocalInt(OBJECT_SELF,"NW_L_Fleeing"))
    {
        RewardXP("M1Q5_Aldo",50,GetPCSpeaker());
        SignalEvent(OBJECT_SELF,EventUserDefined(500));
        SignalEvent(GetLocalObject(GetModule(),"oHector104a"),EventUserDefined(500));
    }
}

