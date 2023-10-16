//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: os_ud_ohio
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Ohio custom user defined script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oSafeWay = GetWaypointByTag("q3_map_undead");
        object oFollow = GetLocalObject(OBJECT_SELF, "OS_FOLLOW");

        if(GetIsInCombat() || IsInConversation(OBJECT_SELF))
            return;

        if(oFollow != OBJECT_INVALID
            && GetLocalInt(OBJECT_SELF,"OS_OHIO_FOLLOW") == 10)
        {
            if ((GetTag(GetArea(oFollow)) != "q1b")
                && (GetTag(GetArea(oFollow)) != "q3f"))
            {
                SetLocalInt(OBJECT_SELF,"OS_OHIO_FOLLOW", 0);
                ClearAllActions(TRUE);
                JumpToObject(oSafeWay);
            }
            else
            {
                ActionForceFollowObject(oFollow,1.0);
            }
        }

/*        object oCage = GetObjectByTag("Q3_CAGE_WALL");
        if(oCage == OBJECT_INVALID)
            return;*/

/*        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        float fDistance = GetDistanceBetween(oPC, OBJECT_SELF);
        if(fDistance > 15.0)
            return;*/


/*        SetFacingPoint(GetPosition(oPC));
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.5, 4.0);
        SpeakOneLinerConversation("q3_beg", oPC);*/

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
        object oGord = GetObjectByTag("q2_thegord");
        SetLocalInt(GetModule(), "OS_THEGORD_ARCH",35);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

