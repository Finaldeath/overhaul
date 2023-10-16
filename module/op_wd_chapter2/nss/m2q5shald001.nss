#include "nw_i0_plot"

void main()
{
    location lWaypoint1 = GetLocation(GetNearestObjectByTag("WP_YESGAR",OBJECT_SELF,1));
    location lWaypoint2 = GetLocation(GetNearestObjectByTag("WP_YESGAR",OBJECT_SELF,2));

    SetLocalInt(OBJECT_SELF,"NW_L_Rescued",10);
    RewardXP("m2q1_Bounty",25, GetPCSpeaker());
    CreateObject(OBJECT_TYPE_CREATURE,"m2q5yesgorc",lWaypoint1);
    CreateObject(OBJECT_TYPE_CREATURE,"m2q5yesgorc",lWaypoint2);
    SignalEvent(OBJECT_SELF,EventUserDefined(500));
}
