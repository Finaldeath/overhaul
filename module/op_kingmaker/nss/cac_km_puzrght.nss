//::///////////////////////////////////////////////
//:: Change the Final Puzzle state by increasing the power
//:: cac_km_puzrght
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Console nob has been turned right, therefore
    Up the power of the device.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////
void main()
{
    object oSelf = GetObjectByTag("km_finalcontroller");
    object oDev1 = GetObjectByTag("ill_device1");
    object oDev2 = GetObjectByTag("ill_device2");

    int iState = GetLocalInt(oSelf, "PUZ_STATE");
    SetLocalInt(oSelf, "PUZ_STATE", iState + 1);

    if((iState + 1) == 1)
    {
        AssignCommand(oDev1, DoPlaceableObjectAction(oDev1, ANIMATION_PLACEABLE_ACTIVATE));
    }
    else if ((iState + 1) == 2)
    {
        AssignCommand(oDev1, DoPlaceableObjectAction(oDev1, ANIMATION_PLACEABLE_ACTIVATE));
        AssignCommand(oDev2, DoPlaceableObjectAction(oDev2, ANIMATION_PLACEABLE_ACTIVATE));
    }
}
