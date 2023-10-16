//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2d_ud_illithid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mindflayers will cause all in the area to
    go hostile to the PC when attacked, etc..
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1005 || nUser == NW_FLAG_SPELL_CAST_AT_EVENT) // ATTACKED // EVENT_SPELL_CAST_AT
    {

        //if the PC was working for the elder brain - set a variable so that the
        //elder brain will be pissed off
        if (GetLocalInt(GetModule(),"elder_brain") > 1)
        {
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            SetLocalInt(GetModule(), "X2_Q2DBrokeIllithidDeal", 1);
            AddJournalQuestEntry("q2_zorvakmur",97,oPC);
            //Set variable for Siege - Mindflayers are back in
            SetGlobalInt("X2_Q2DOvermind", 1);
        }
        if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0)
            return;
        ExecuteScript("q2d1_illithidatk", OBJECT_SELF);
    }


}

