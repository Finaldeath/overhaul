//::///////////////////////////////////////////////
//:: OnUse: Toggle Activate
//:: q2d_use_doorctrl
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Simple script to toggle the placeable animation
    state for placeables that support Activate and
    DeActivate Animations

    Placeables are best set to be DeActivated by
    default with this script.

    Illithid contol that opens the nearest door object

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-09-10
//:://////////////////////////////////////////////
//:: Keith Warner Sept 23/03
void main()
{
    // * note that nActive == 1 does  not necessarily mean the placeable is active
    // * that depends on the initial state of the object
    int nActive = GetLocalInt (OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE");
    //Nearest Door
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
    //Check distance to the nearest door in case the 'correct' one has been destroyed
    int nNear = FALSE;
    if (GetDistanceBetween(OBJECT_SELF, oDoor) < 7.0)
        nNear = TRUE;
    // * Play Appropriate Animation

    if (!nActive)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        if (nNear == TRUE)
        {
            SetLocked(oDoor, FALSE);
            AssignCommand(oDoor, ActionOpenDoor(oDoor));
        }
    }
    else
    {
      ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        if (nNear == TRUE)
        {
            AssignCommand(oDoor, ActionCloseDoor(oDoor));
            SetLocked(oDoor, TRUE);
        }
    }
    // * Store New State
    SetLocalInt(OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE",!nActive);
}
