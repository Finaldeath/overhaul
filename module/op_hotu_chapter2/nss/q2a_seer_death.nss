//::///////////////////////////////////////////////
//:: Name x2_def_ondeath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
#include "nw_i0_plot"
void JumpPCToMatron();
void ClearAOE(object oCreature);
void main()
{

    if (GetLocalInt(OBJECT_SELF, "nDieOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nDieOnce", 1);

    object oBattleMaster = GetObjectByTag("q2abattle2master");

    ClearAOE(OBJECT_SELF);

    //if the Seer has died during the House maeviir Betrayal fight
    //this variable should be set to 3
    //if the Seer survives (the House maeviir Matron dies)
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Wave1") == 1)
    {
        SetLocalInt(GetModule(), "X2_Q2ABattleSeerDead", 1);
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        ExecuteScript("cutscene111", oPC);

        return;
    }

    //if the rebels were betrayed and the seer dies - the PC is victorious
    if (GetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed") == 1)
    {
        SetLocalInt(GetModule(), "X2_Q2ABattleSeerDead", 2);
        //Reward the PC some experience
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        AdjustAlignment(oPC, ALIGNMENT_EVIL, 10);
        Reward_2daXP(oPC, 57, FALSE);
        ExecuteScript("cutscene113", oPC);

    }
    //if the PC is on the side of the rebels and the seer dies - the PC is a loser
    else
    {
        SetLocalInt(GetModule(), "X2_Q2ABattleSeerDead", 1);
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        ExecuteScript("cutscene112", oPC);
    }

}

void JumpPCToMatron()
{
    object oTarget = GetObjectByTag("wp_q2a9_pcsiegeoffer");
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        AssignCommand(oPC, JumpToObject(oTarget));
        oPC = GetNextPC();
    }
}
//Clear  a sphere around a creature of all area of effect spells
void ClearAOE(object oCreature)
{
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(oCreature);

    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_CUBE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);


    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
        {
            DestroyObject(oTarget);
        }

       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_CUBE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    }
}
