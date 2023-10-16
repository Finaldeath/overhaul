//::///////////////////////////////////////////////
//:: Name q2d1_illithidatk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Illithid and all thralls will attack the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 30/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") == 0)
        SetLocalInt(GetModule(), "X2_Q2DIllithidHostile", 1);

    AddJournalQuestEntry("q2_zorvakmur",60,GetPCSpeaker());
    //Activate Wandering Monsters
    object oArea = GetArea(OBJECT_SELF);
    SetLocalString(oArea,"X2_WM_ENCOUNTERTABLE", "ZorvakMurEntry");

    //All illithid in this area will turn hostile.
    object oMind = OBJECT_SELF;
    string szTag;
    ChangeToStandardFaction(oMind, STANDARD_FACTION_HOSTILE);
    AssignCommand(oMind, DetermineCombatRound());
    object oThrall = GetFirstObjectInArea();
    while (oThrall != OBJECT_INVALID)
    {
        szTag = GetTag(oThrall);
        if (GetStringLeft(szTag, 9) == "q2dthrall")
        {
            if (GetLocalInt(oThrall, "nFreed") != 1)
            {
                ChangeToStandardFaction(oThrall, STANDARD_FACTION_HOSTILE);
                AssignCommand(oThrall, DetermineCombatRound());
            }
        }
        else if (GetStringLeft(szTag, 7) == "q2d_ill")
        {
            ChangeToStandardFaction(oThrall, STANDARD_FACTION_HOSTILE);
            AssignCommand(oThrall, DetermineCombatRound());
        }

        oThrall = GetNextObjectInArea();
    }
}
