//::///////////////////////////////////////////////
//:: bk-seeplayerinit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   When he sees a player, init for the first time
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: October 1
//:://////////////////////////////////////////////

void main()
{
    object oSeen = GetLastPerceived();
    if (GetIsObjectValid(oSeen)  && GetLocalInt(OBJECT_SELF, "X2_SPEAKONCE") == 0)
    {
        if (GetIsPC(oSeen) == TRUE)
        {
            if (GetLastPerceptionSeen() == TRUE)
            {
                ClearAllActions();
                ActionStartConversation(oSeen);
                SetLocalInt(OBJECT_SELF, "X2_SPEAKONCE", 1);
            }
        }
    }
}
