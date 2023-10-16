//::///////////////////////////////////////////////
//:: Shadow Door (OnUse)
//:: Us_ShadowDoor.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player back to the Portable Door.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 18, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oPortableDoor = GetObjectByTag("PL_PortableDoor");
    int bOpen = GetLocalInt(OBJECT_SELF, "bOpen");

    if (bOpen == FALSE)
    {
        PlayAnimation(ANIMATION_PLACEABLE_OPEN);
        SetLocalInt(OBJECT_SELF, "bOpen", TRUE);
        DelayCommand(6.0, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));
        DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "bOpen", FALSE));
    }

    if (bOpen == TRUE)
    {
        //If the portable door has been picked up, use the last known location.
        location lPortableDoor = GetLocation(oPortableDoor);
        if (oPortableDoor == OBJECT_INVALID)
        {
            lPortableDoor = GetLocalLocation(GetModule(), "lPortableDoor");
        }

        //Jump the player back to the Prime Material Plane
        AssignCommand(oPC, JumpToLocation(lPortableDoor));
    }
}
