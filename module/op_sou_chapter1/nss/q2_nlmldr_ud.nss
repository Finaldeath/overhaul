//::///////////////////////////////////////////////
//:: Nilmaldor HB
//:: q2_nlmldr_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have Nilmaldor randomly wander the room.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 10/2/2003
//:://////////////////////////////////////////////


void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 1001) // hb
    {
        if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
        {
            int nMoving = GetLocalInt(OBJECT_SELF, "Q2_MOVING");
            if(nMoving == 1)
                return; // do this to prevent the action queue from over-flowing

            if(IsInConversation(OBJECT_SELF))
                return;

            string sWPBaseTag = "Q2_WP_NILMALDOR_RANDOM"; // add number 1-5 to the left for exact WP
            int nWalkChance = Random(4); // 0 - dont walk, 1,2,3 - walk
            int nRand = Random(6) + 1;  // random WP
            if (nWalkChance == 0)
                 return;
            string sWPTag = sWPBaseTag + IntToString(nRand);
            object oWP = GetWaypointByTag(sWPTag);
            SetLocalInt(OBJECT_SELF, "Q2_MOVING", 1);
            ActionMoveToObject(oWP);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "Q2_MOVING", 0)); // now he can get a new move action
        }
    }
}
