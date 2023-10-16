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
        object oTarget = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_NOT_PC);
        if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q1ASpeakingToPC") == FALSE &&
           GetLocalObject(OBJECT_SELF,"NW_L_M1Q1ALastTarget") != oTarget &&
           GetDistanceToObject(oTarget) < 10.0f &&
           Random(2) == 1 &&
           GetStringLeft(GetTag(oTarget),4) == "TALK" &&
           GetIsDay())
        {
            SetLocalObject(OBJECT_SELF,"NW_L_M1Q1ALastTarget",oTarget);
            ClearAllActions();
            ActionStartConversation(oTarget,"M1SmallTalk");
        }
    }


}

