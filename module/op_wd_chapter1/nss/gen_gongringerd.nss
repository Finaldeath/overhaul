//::///////////////////////////////////////////////
//:: Generic Gong Ringer: User Defined
//:: Gen_GongRingerD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script causes the Gong Ringer to
    assign a gong target to the nearest perceived
    enemy, run to the nearest alarm gong, and use
    it to call for reinforcements.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 23, 2001
//:://////////////////////////////////////////////

void main()
{
    int iEvent = GetUserDefinedEventNumber();
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    object oGongTarget = GetNearestObjectByTag("Gong_Target");
    object oGong = GetNearestObjectByTag("Alarm_Gong");

    switch (iEvent)
    {
        case (1002):
        {

//If the object I've Perceived is an Enemy...
            if (GetIsObjectValid(oEnemy) == TRUE)
            {

//...and if a Gong Target does not already exist...
                if (GetIsObjectValid(oGongTarget) == FALSE)
                {

//...create a new Gong Target at the nearest Enemy's location and give it a
//   lifespan of 30 seconds.
                    location lEnemy = GetLocation(oEnemy);
                    oGongTarget = CreateObject(OBJECT_TYPE_PLACEABLE, "Gong_Target", lEnemy);
                    DestroyObject(oGongTarget, 30.0);

//                    location lMyLocation = GetLocation(OBJECT_SELF);
//                    CreateObject(OBJECT_TYPE_PLACEABLE, "Debug_Cyan", lMyLocation);

//Clear all actions, run to the nearest Alarm Gong and Use it.
                    ClearAllActions();

//                    SetLocalInt(OBJECT_SELF, "GongConversationState", 1);
//                    ActionStartConversation(OBJECT_SELF);

                    SetLocalInt(OBJECT_SELF, "GongTask", TRUE);
//                    ActionMoveToObject(oGong, TRUE, 2.5);
                    ActionInteractObject(oGong);

//The gong will assign all further actions from there.
                }
            }
        }
        break;

        case (1004): //Custom OnDialog Event
        {
//If I am running for the gong, ignore my friends' pleas for help.
            int iGongTask = GetLocalInt(OBJECT_SELF, "GongTask");

            if (iGongTask == TRUE)
            {
                ClearAllActions();
                ActionMoveToObject(oGong, TRUE, 2.5);
                ActionInteractObject(oGong);
            }
        }
        break;
    }
}
