//::///////////////////////////////////////////////
//:: Plane of Shadow (OnExit)
//:: Ex_Wizard_03.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Turn the portal VFX off for the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();
    object oRefPoint = GetObjectByTag("Reference_Crypt_03");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oRefPoint);

    if (oPC == OBJECT_INVALID || oPC == oExiter)
    {
        SetLocalInt(OBJECT_SELF, "bPortalsOn", FALSE);
    }
}
