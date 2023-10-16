//::///////////////////////////////////////////////
//:: Door Lever, 2nd Floor, Crypt Tower (OnUse)
//:: Us_Lever_Crypt02.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Open the doors to the next level.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 29, 2003
//:://////////////////////////////////////////////

void main()
{
/*DEBUG*///SendMessageToPC(GetLastUsedBy(), "DEBUG: Lever Activated...");

    //Animate the lever
    PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    DelayCommand(1.0, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));

    object oPC = GetLastUsedBy();
    //Unlock and open the doors
    object oDoorA = GetObjectByTag("Crypt_02A_Crypt_03A");
    object oDoorB = GetObjectByTag("Crypt_02B_Crypt_03B");
    SetLocked(oDoorA, FALSE);
    SetLocked(oDoorB, FALSE);
    AssignCommand(oPC, PlaySound("as_cv_crank1"));
    //AssignCommand(oDoorA, ActionOpenDoor(oDoorA));
    //AssignCommand(oDoorB, ActionOpenDoor(oDoorB));
}
