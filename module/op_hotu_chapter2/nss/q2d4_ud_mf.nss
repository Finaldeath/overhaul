//::///////////////////////////////////////////////
//:: Default: q2d4_ud_mf
//::
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On attacked in the Grand hall - set the Illithids as
    hostile -
    turn the Hall guards hostile and attack the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 22/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") == 1)
        return;

    SetLocalInt(GetModule(), "X2_Q2DIllithidHostile", 1);

    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);



    AddJournalQuestEntry("q2_zorvakmur",60,oPC);

    //Activate Wandering Monsters
    object oArea = GetArea(OBJECT_SELF);
    SetLocalString(oArea,"X2_WM_ENCOUNTERTABLE", "ZorvakMurHall");

    //All illithid in this area will turn hostile.
    object oMind = GetFirstObjectInArea();

    while (GetIsObjectValid(oMind) != FALSE)
    {
        if (GetObjectType(oMind) == OBJECT_TYPE_CREATURE)
        {
            if (GetIsPC(oMind) == FALSE)
            {
                if (GetIsObjectValid(GetMaster(oMind)) == FALSE)
                {
                    ChangeToStandardFaction(oMind, STANDARD_FACTION_HOSTILE);
                    AssignCommand(oMind, DetermineCombatRound());
                }
            }
        }

        oMind = GetNextObjectInArea();
    }

    return;

}
