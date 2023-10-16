//::///////////////////////////////////////////////
//:: m1q2 Prison Door Conversation
//:: m1q2_PrisonDoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script checks to see if Dhanis (the door
    bouncer) is still near the door on the inside
    of the prison. If so, the door starts
    conversation with the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Dec 20, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    object oDhanis = GetObjectByTag("M1Q02Cdhanis");
    object oInteriorDoor = GetObjectByTag("m1q2B_m1q2A");
    float fDistance = GetDistanceBetween(oDhanis, oInteriorDoor);

    if (!GetIsDead(oDhanis))
    {
        if (GetIsObjectValid(oDhanis))
        {
            if (GetIsObjectValid(oInteriorDoor))
            {
                if (fDistance < 15.0)
                {
                    ActionStartConversation(oPC);
                }
            }
        }
    }
}
