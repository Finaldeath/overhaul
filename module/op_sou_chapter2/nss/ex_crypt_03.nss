//::///////////////////////////////////////////////
//:: Crypt Tower, Level 3 (OnExit)
//:: Ex_Crypt_03.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Shut down the maze when the player leaves.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();
    object oRefPoint = GetObjectByTag("Reference_Crypt_03");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oRefPoint);

    if (oPC == OBJECT_INVALID || oPC == oExiter)
    {
        SetLocalInt(OBJECT_SELF, "bMazeOn", FALSE);
    }
}
