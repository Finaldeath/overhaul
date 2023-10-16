//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_wolfh
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Behavior for hunting wolves if a Giant Ranger
     is around.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 12, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oGiant = GetNearestObjectByTag("hx_frostg_rang");
        object oAttackee = GetAttackTarget(oGiant);

        if(GetIsObjectValid(oGiant))
        {
            if(!GetIsInCombat(OBJECT_SELF) && !IsInConversation(OBJECT_SELF))
            {
                if(GetIsInCombat(oGiant))
                {
                    if(GetCurrentAction(OBJECT_SELF) != ACTION_ATTACKOBJECT)
                    {
                        ClearAllActions(TRUE);
                        ActionAttack(oAttackee);
                    }
                }
                else if(GetCurrentAction() != ACTION_FOLLOW)
                {
                    ClearAllActions(TRUE);
                    ActionForceFollowObject(oGiant, 6.0);
                }
                else
                {
                    ClearAllActions(TRUE);
                    ActionRandomWalk();
                }
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

