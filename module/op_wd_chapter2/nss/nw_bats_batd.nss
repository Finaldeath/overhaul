//::///////////////////////////////////////////////
//:: User Defined
//:: NW_BATS_BATD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Bats fly toward the PC and then exit.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 6, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExit = GetNearestObjectByTag("NW_EXIT");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    ClearAllActions();
    //ActionMoveToObject(oPC,TRUE);
    ActionMoveToObject(oExit,TRUE);
    DelayCommand(10.0,DestroyObject(OBJECT_SELF));
}
