//::///////////////////////////////////////////////
//:: SouthEast Door, Temple of Winds, 3rd Floor (OnUse)
//:: Us_Wind3Door_SE.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player to the appropriate location
     on the Temple's 2nd Floor.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 20, 2003
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetObjectByTag("Winds_02_SE");
    object oPC = GetLastUsedBy();
    int bOpen = GetLocalInt(OBJECT_SELF, "bOpen");

    if (bOpen == FALSE)
    {
        //Open the door.
        PlayAnimation(ANIMATION_PLACEABLE_OPEN);
        SetLocalInt(OBJECT_SELF, "bOpen", TRUE);
        DelayCommand(6.0, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));
        DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "bOpen", FALSE));
    }
    if (bOpen == TRUE)
    {
        //Jump the player to the 3rd Floor
        PlayAnimation(ANIMATION_PLACEABLE_OPEN);
        DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oTarget)));
        DelayCommand(2.0, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));
    }
}
