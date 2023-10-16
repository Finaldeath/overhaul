//::///////////////////////////////////////////////
//:: Surrender User Defined
//:: SURRENDER_UDEF
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through a 20ft radius around the NPC and
    sets all people to clear all actions and
    improves the reputation of enemies towards the
    NPC and clears their actions
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 16, 2001
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser == 1002)
    {
        if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") ==0)
        {
//            ActionStartConversation(OBJECT_SELF);
            SpeakOneLinerConversation();
            SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
        }
    }
    else
    if(nUser == 1006)
    {
        int nMaxHP = GetMaxHitPoints();
        int nCurrHP = GetCurrentHitPoints();
        SpeakString("Current HP: " + IntToString(nCurrHP));

        if((nCurrHP * 2) <= nMaxHP)
        {
            SetLocalInt(OBJECT_SELF, "Generic_Surrender", 1);
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            while(GetIsObjectValid(oTarget))
            {
                if(oTarget != OBJECT_SELF)
                {
                    if(GetIsEnemy(oTarget))
                    {
                        ClearPersonalReputation(oTarget);
                        SetIsTemporaryFriend(oTarget);
                        SpeakString(GetName(oTarget) +  " Adjusted to" + IntToString(GetReputation(OBJECT_SELF, oTarget)));
                    }
                    AssignCommand(oTarget, ClearAllActions());
                    AssignCommand(oTarget, ActionAttack(OBJECT_INVALID));
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            }
            ClearAllActions();
          //  ActionAttack(OBJECT_INVALID);
         // ActionWait(15.0);
            //ActionStartConversation(OBJECT_SELF);
            SpeakOneLinerConversation();
        // SpeakString("I should be starting conversation to beg for mercy but that is broken.  Please talk to me");
        }
    }
}
