//::///////////////////////////////////////////////
//:: Witchwork 1: Starting Area, On Exit
//:: WW1_Start_OnExit.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     For optimization purposes, stop all of the
     soldiers from fighting each other if there
     are no players left in the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 27, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();
    object oAhmed = GetObjectByTag("PrinceAhmedVis");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oAhmed);

    //Heal any exiting players
    effect eHeal = EffectHeal(500);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oExiter);

    //Double-check to ensure you're not getting the Exiting PC
    if (oPC == oExiter)
    {
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oAhmed, 2);
    }

    //If there are no players left in the area, set a local to keep the
    //soldiers from fighting each other (optimization)
    if (oPC == OBJECT_INVALID)
    {
        SetLocalInt(OBJECT_SELF, "bCinematicOn", FALSE);
    }
}
