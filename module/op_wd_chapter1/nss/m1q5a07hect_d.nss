#include "M1_Plot"
void main()
{
    object oMaster = GetLocalObject(OBJECT_SELF,"NW_L_FollowTarget");
    switch(GetUserDefinedEventNumber())
    {
        case 500:
        {
            SetLocalObject(OBJECT_SELF,"NW_L_FollowTarget",OBJECT_INVALID);
            FleeArea("WP_M1Q5AldoEscape");
        }
        break;
        case 1001:
        {

            if(GetIsInCombat() == FALSE &&
               IsInConversation(OBJECT_SELF) == FALSE)
            {
                if(GetIsObjectValid(oMaster))
                {
                    ClearAllActions();
                    ActionForceFollowObject(oMaster,5.0);
                }
            }
        }
        break;
        case 1005:
        {
            if(GetLastAttacker() == oMaster)
            {
                SetLocalObject(OBJECT_SELF,"NW_L_FollowTarget",OBJECT_INVALID);
            }
        }
        break;
    }

}
