//::///////////////////////////////////////////////
//:: Catapult: Move Backward
//:: Cat_Move_Back.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the catapult backward 1 meter.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oCurrentArea = GetArea(OBJECT_SELF);
    vector vCurrentPosition = GetPosition(OBJECT_SELF);
    float fCurrentFacing = GetFacing(OBJECT_SELF);

//////////////////////////////////////////////////////////
    //This is a hack to work around a known GetFacing() //
    //math error in the scripting language. It can be   //
    //removed once the issue has been patched.          //
    if (fCurrentFacing > 360.0)                         //
    {                                                   //
        fCurrentFacing = 720 - fCurrentFacing;          //
    }                                                   //
//////////////////////////////////////////////////////////

    vector vDelta;
    vDelta.x = cos(fCurrentFacing) * -1;
    vDelta.y = sin(fCurrentFacing) * -1;

    vector vNewPosition;
    vNewPosition.x = vCurrentPosition.x + vDelta.x;
    vNewPosition.y = vCurrentPosition.y + vDelta.y;

    location lNewPosition = Location(oCurrentArea, vNewPosition, fCurrentFacing);
    DestroyObject(OBJECT_SELF);
    object oNewCatapult = CreateObject(OBJECT_TYPE_PLACEABLE, "catapult", lNewPosition);

    //Re-designate the player as owner of that catapult.
    SetLocalObject(oNewCatapult, "oOwner", oPC);
    SetLocalObject(oPC, "oCatapult", oNewCatapult);

    //Make the catapult relaunch its conversation with the player.
    AssignCommand(oNewCatapult, ActionStartConversation(oPC, "", TRUE));
}
