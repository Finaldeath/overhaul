//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(GetIsInCombat() || IsInConversation(OBJECT_SELF))
            return;
        // her status can be one of the following:
        // 0 - initial
        // 1 - walking to shelves
        // 2 - arrived to shelves
        // 3 - walking to pire
        // 4 - arrived to pire
        int nStatus = GetLocalInt(OBJECT_SELF, "STATUS");
        if(nStatus == 0) // then walk to the next shelf
        {
            SetLocalInt(OBJECT_SELF, "STATUS", 1);
            int nCurrent = GetLocalInt(OBJECT_SELF, "CURRENT");
            nCurrent++;
            if(nCurrent == 10)
                nCurrent = 1;
            SetLocalInt(OBJECT_SELF, "CURRENT", nCurrent);
            string sTag = "q6c_wp_collect" + IntToString(nCurrent);
            object oWP = GetWaypointByTag(sTag);
            SpeakOneLinerConversation("q6c_meduda_ol");
            ActionMoveToObject(oWP);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "STATUS", 2));
            ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
        }
        else if(nStatus == 2) // then walk to the pire
        {
            SetLocalInt(OBJECT_SELF, "STATUS", 3);
            object oPire = GetNearestObjectByTag("q6c_wp_burn");
            SpeakOneLinerConversation("q6c_meduda_ol");
            ActionMoveToObject(oPire);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "STATUS", 4));
            ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
        }
        else if(nStatus == 4)
            SetLocalInt(OBJECT_SELF, "STATUS", 0);



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
        object oPC = GetFirstPC();
        // a evil hit if killing the medusa after talking to the guard or after taking the shard from her
        if(GetLocalInt(GetModule(), "Q6_PLAYER_KNOWS_MEDUSA") == 1 ||
           GetItemPossessedBy(OBJECT_SELF, "q6_shard") == OBJECT_INVALID)
        {
            if(GetAlignmentGoodEvil(oPC) != ALIGNMENT_CHAOTIC)
                AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

