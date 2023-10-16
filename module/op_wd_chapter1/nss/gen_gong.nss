//::///////////////////////////////////////////////
//:: Generic Gong
//:: Gen_Gong
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is part of the generic gong system.
    It causes creatures friendly to the gong to
    run to a dynamically defined target point. A
    separate script on the creature defines that
    target point and causes it to make use of the
    gong.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 22, 2001
//:://////////////////////////////////////////////

void main()
{
    object oGongTarget = GetNearestObjectByTag("Gong_Target");
    location lGongLocation = GetLocation(OBJECT_SELF);
    int iFriendNumber = 1;
    object oCurrentFriend = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, iFriendNumber);
    float fCurrentDistance = GetDistanceToObject(oCurrentFriend);

//Say a Text Bubble (replace with sound once available).
    ActionStartConversation(OBJECT_SELF);

//If no Gong Target exists, spawn one in at the Gong (This will eventually be
//changed to a Waypoint, not a Placeable.) Destroy the Target in 30 seconds.
    if (GetIsObjectValid(oGongTarget) == FALSE)
    {
        oGongTarget = CreateObject(OBJECT_TYPE_PLACEABLE, "Gong_Target", lGongLocation);
        DestroyObject(oGongTarget, 30.0);
    }

//Find a creature that's within 20 meters and that my faction considers friendly...
    while (GetIsObjectValid(oCurrentFriend) == TRUE && fCurrentDistance <= 20.0)
    {

//Highlight them for debug purposes.
//        location lFriendLocation = GetLocation(oCurrentFriend);
//        CreateObject(OBJECT_TYPE_PLACEABLE, "Debug_Red", lFriendLocation);

//Cancel any Gong Task they may have.
        SetLocalInt(oCurrentFriend, "GongTask", FALSE);

//Have them move to the Gong Target.
        AssignCommand(oCurrentFriend, ActionMoveToObject(oGongTarget, TRUE, 3.0));

//...Have them say an appropriate text bubble...
//        SetLocalInt(oCurrentFriend, "GongConversationState", 2); //2 = Responding to Gong
//        AssignCommand(oCurrentFriend, ActionStartConversation(OBJECT_SELF));

//Find another creature that is within 20 meters and that my faction considers friendly.

        iFriendNumber++;
        oCurrentFriend = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, iFriendNumber);
        fCurrentDistance = GetDistanceToObject(oCurrentFriend);
    }
}
