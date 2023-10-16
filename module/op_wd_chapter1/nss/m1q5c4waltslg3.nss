#include "NW_I0_Plot"
void main()
{
    //SetLocalInt(OBJECT_SELF,"NW_L_M1Q5C2Location",1);
    //SignalEvent(OBJECT_SELF,EventUserDefined(506));
    ClearAllActions();
    ActionForceMoveToObject(GetObjectByTag("M1Q5C1_M1Q5A16a"));
    ActionJumpToObject(GetObjectByTag("WP_M1Q5AWalters"));
    SetCommandable(FALSE);
    // 11/24/2004 - Only award the experience points once.
    if ( GetLocalInt(GetModule(), "NW_L_WaltersReturned") != TRUE )
    {
        RewardXP("M1Q5_Begg_2b",50,GetPCSpeaker());
    }
    SetLocalInt(GetModule(),"NW_L_WaltersReturned",TRUE);
}
