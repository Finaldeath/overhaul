//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2d_ud_glad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    //On attacked or spell cast at - the gladiators go hostile and
    //the PC can never do the Slave Rebellion or the Betrayal of the Gladiators
    //to the overmind.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 17/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{

    if (GetLocalInt(GetModule(), "X2_Q2DGladsAttackedInPens") == 1)
        return;

    SetLocalInt(GetModule(), "X2_Q2DGladsAttackedInPens", 1);
    //On attacked or spell cast at - the gladiators go hostile and
    //the PC can never do the Slave Rebellion or the Betrayal of the Gladiators
    //to the overmind.

    string szTag;
    object oThrall = GetFirstObjectInArea();
    while (oThrall != OBJECT_INVALID)
    {
        if (GetObjectType(oThrall) == OBJECT_TYPE_CREATURE)
        {
            szTag = GetTag(oThrall);
            if (GetStringLeft(szTag, 7) == "q2dthra" || szTag == "q2dslaveleader")
            {
                ChangeToStandardFaction(oThrall, STANDARD_FACTION_HOSTILE);
                AssignCommand(oThrall, DetermineCombatRound());
            }

        }
        oThrall = GetNextObjectInArea();
    }



}

