//::///////////////////////////////////////////////
//:: Generic barricaded kobold hb
//:: q2_kobold_wan_ud
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kobolds run away from player whenever he is too close, and sometimes run to Urko.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 11/2/2003
//:://////////////////////////////////////////////
void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    int nRand = Random(12); // 0 - run to urko
    if(nEvent == 1001) // HB
    {
        if(GetIsInCombat())
        {
            if(nRand >= 0 && nRand <= 2)
                SpeakOneLinerConversation();
            return;
        }
        float MIN_DISTANCE = 3.0;
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        float fDistance = GetDistanceBetween(oPC, OBJECT_SELF);
        object oKobold = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
        object oUrko = GetObjectByTag("Q2_URKO");
        //float fDistance2 = GetDistanceBetween(oKobold, OBJECT_SELF);
        float fDistanceUrko = GetDistanceBetween(oUrko, OBJECT_SELF);
        int nLeaving = GetLocalInt(OBJECT_SELF, "LEAVING_ROOM");
        // run away from player whenever not in combat, player is close, and urko is far and not leaving room
        if(!nLeaving && !GetIsInCombat() && fDistance <= MIN_DISTANCE && fDistanceUrko > MIN_DISTANCE * 2)
        {
            ClearAllActions();
            // find the second-closest run WP and run to it
            object oWP = GetNearestObjectByTag("Q2_WP_KOBOLD_RUN", OBJECT_SELF, 2);
            SpeakStringByStrRef(40301);
            ActionMoveToObject(oWP, TRUE);
            ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
            ActionSpeakStringByStrRef(40302);
            ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT);

        }
        else if(fDistance > MIN_DISTANCE)
        {

            if(fDistanceUrko <= MIN_DISTANCE)
            {
                ClearAllActions();
                ActionMoveAwayFromObject(oUrko, TRUE, 8.0);
            }

            /*if(nRand >= 1 && nRand <= 2 &&
                !GetIsInCombat() && fDistance2 <= MIN_DISTANCE) // if close to a kobold - talk to him
            {
                //ClearAllActions();
                SetFacingPoint(GetPosition(oKobold));
                if(nRand == 1)
                    ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0);
                else
                    ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 3.0);
            }*/

            if(!GetIsInCombat() && nRand == 0) // run to Urko
            {
                ClearAllActions();
                if(IsInConversation(oUrko))
                    return;
                ActionMoveToObject(oUrko, TRUE);
                ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 3.0);
                AssignCommand(oUrko, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0));
                ActionMoveAwayFromObject(oUrko, TRUE, 5.0);
            }

        }

    }
    else if(nEvent == 101) // exit room
    {
        object oWP = GetWaypointByTag("Q2_WP_KOBOLD_EXIT");
        SetLocalInt(OBJECT_SELF, "LEAVING_ROOM", 1);
        ClearAllActions();
        ActionForceMoveToObject(oWP);
        DestroyObject(OBJECT_SELF, 15.0);
        SetCommandable(FALSE, OBJECT_SELF);
    }

    return;

}
