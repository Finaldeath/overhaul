//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName:
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

        if (GetLocalInt(OBJECT_SELF, "nFed") != 1)
        {
            if (!GetIsObjectValid(GetAttemptedAttackTarget())
            && !GetIsObjectValid(GetAttemptedSpellTarget())
            && !IsInConversation(OBJECT_SELF) && GetLocalInt(OBJECT_SELF, "nBusy") != 1)
            {
                ActionRandomWalk();
            }
        }
        else
        {
            if (GetDistanceToObject(GetWaypointByTag("q2e_bearspn_1")) > 5.0)
            {
                ActionMoveToLocation(GetLocation(GetWaypointByTag("q2e_bearspn_1")));
            }
            else
            {
                AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 30.0));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSleep(), OBJECT_SELF, 30.0);
                DelayCommand(30.0, SetLocalInt(OBJECT_SELF, "nFed", 0));
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
        if (GetLocalInt(OBJECT_SELF, "nCounted") != 1)
        {
            //Spawn in a new bear to replace the dead one..
            CreateObject(OBJECT_TYPE_CREATURE, "q2ebear", GetLocation(GetWaypointByTag("q2ebearspawn")));
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

