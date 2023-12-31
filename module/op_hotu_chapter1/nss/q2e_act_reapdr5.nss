//::///////////////////////////////////////////////
//:: Name  q2e_act_reapdr5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When entered - this trigger will grab the
    corresponding reaper door, lower it (by destroying
    the old one and creating a new one), and open it,
    and start its dialog with the PC that triggered
    this event.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////
#include "x0_inc_portal"
void main ()
{
    object oPC = GetEnteringObject();

    //If no anchor exists for this door, do nothing..

    if (PortalAnchorExists(5, oPC) == FALSE)
    {
        if (GetLocalInt(oPC, "X2_ReapDoor5Warning") != 1)
        {
            SetLocalInt(oPC, "X2_ReapDoor5Warning", 1);
            FloatingTextStrRefOnCreature(83358, oPC, FALSE);
            DelayCommand(10.0, SetLocalInt(oPC, "X2ReapDoor5Warning", 0));
        }

        return;
    }
    //Halt the PC that used the trigger
    AssignCommand(oPC, ClearAllActions());
    //Grab the door that corresponds to this trigger
    object oDoor = GetObjectByTag("x2_reapdoor" + GetStringRight(GetTag(OBJECT_SELF), 1));
    //Get the position of the original door (in the air)
    vector vDoor = GetPosition(oDoor);
    //Create a vector based on the original door, but lower (on the ground)
    vector vNewDoor = Vector(vDoor.x, vDoor.y, vDoor.z - 1.5);
    //Create a location based on the above vector which is where we will locate the new door
    location lDoor = Location(GetArea(OBJECT_SELF), vNewDoor, GetFacing(oDoor));
    //Apply a little effect up in the air when we lower the door
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(471), GetLocation(oDoor));
    //Destroy the old door
    DestroyObject(oDoor);
    //Create the new door
    object oNewDoor = CreateObject(OBJECT_TYPE_PLACEABLE, "x2_reapdoor", lDoor, TRUE, "x2_reapdoor" + GetStringRight(GetTag(OBJECT_SELF), 1));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oNewDoor);
    //Open the new door
    AssignCommand(oNewDoor, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
    //Start the dialog with the PC that used the door
    string szTag = "con_hod_door" + GetStringRight(GetTag(OBJECT_SELF), 1);

    //Set the base custom token
    string szAreaWP = PortalGetAnchorName(5, oPC);
    SetCustomToken(4905, GetName(GetArea(GetWaypointByTag(szAreaWP))));
    AssignCommand(oNewDoor, ActionStartConversation(oPC, szTag));

}

