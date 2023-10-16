//::///////////////////////////////////////////////
//:: M4Q1_VANYA_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Follows Player if player has agreed to her services.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: March 8, 2002
//:://////////////////////////////////////////////

#include "M4PLOTINCLUDE"

void main()
{
//    SpeakString("This is my userdefined.");
    int nUser = GetUserDefinedEventNumber();
    if (nUser==1001)
    {

/*      SpeakString("This is my heartbeat.");
        if ((IsInConversation(OBJECT_SELF) == FALSE) && (GetIsInCombat() == FALSE))
        {
//        SpeakString("I am not busy");
            if (GetLocalInt(OBJECT_SELF,"NW_L_HIRED") == 10)
            {
//                SpeakString("I am following you.");
                ClearAllActions();
                ActionForceMoveToObject(GetLocalObject(OBJECT_SELF,"NW_L_HIREDBY"),TRUE, 5.5, 5.0);
            }
        }*/
        if(GetLocalInt(OBJECT_SELF,"NW_L_HIRED")==10)
        {
            ClearAllActions();
            FollowPlayer(GetLocalObject(OBJECT_SELF, "NW_L_HIREDBY"));
        }
        else if (GetLocalInt(OBJECT_SELF,"NW_L_HIRED")==99)
        {
            if (GetLocation(OBJECT_SELF) != GetLocation(GetObjectByTag("WP_VANYA_START")))
            {
                ClearAllActions();
                ActionMoveToObject(GetObjectByTag("WP_VANYA_START"));
            }
        }
    }
}
