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

        if (!GetIsObjectValid(GetAttemptedAttackTarget())
        && !GetIsObjectValid(GetAttemptedSpellTarget())
        && !IsInConversation(OBJECT_SELF))
        {
            if(Random(10) > 4)
            {
                ActionRandomWalk();
            }
            else
            {
                ActionMoveToLocation(GetLocation(GetWaypointByTag("q2ewolfspawn")));
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
            //Spawn in a new deer to replace the dead one..
            CreateObject(OBJECT_TYPE_CREATURE, "q2edeer", GetLocation(GetWaypointByTag("q2edeerspawn")));
            //if I was killed by a bear - mark the bear as 'fed' and send it to hibernate
            object oKiller = GetLastKiller();
            if (GetTag(oKiller) == "q2ebear")
            {
                SetLocalInt(oKiller, "nFed", 1);
                int nCount = 0;
                object oDeer = GetObjectByTag("q2edeer", nCount);
                while (oDeer != OBJECT_INVALID)
                {
                    SetIsTemporaryFriend(oDeer, oKiller, TRUE, 60.0);
                    nCount = nCount + 1;
                    oDeer = GetObjectByTag("q2edeer", nCount);
                }
                nCount = 0;
                object oWolf = GetObjectByTag("q2ewolf", nCount);
                while (oWolf != OBJECT_INVALID)
                {
                    SetIsTemporaryFriend(oWolf, oKiller, TRUE, 60.0);
                    nCount = nCount + 1;
                    oWolf = GetObjectByTag("q2ewolf", nCount);
                }
            }
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

