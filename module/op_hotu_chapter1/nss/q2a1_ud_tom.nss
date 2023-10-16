//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName:
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "x2_inc_plot"

void main()
{

    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        SetLocalInt(GetModule(), "X2_TOMDEAD", 1);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 1011)
    {
        if (GetLocalInt(OBJECT_SELF, "nRaised") != 1 && (GetLastSpell() == SPELL_RAISE_DEAD || GetLastSpell() == SPELL_RESURRECTION))
        {
            //Add any journal entry here
            //AddJournalQuestEntry("q2oldfriends", nJournal, GetLastSpellCaster());
            SetLocalInt(OBJECT_SELF, "nRaised", 1);
            SetLocalInt(GetModule(), "X2_TOMDEAD", 0);
            object oPC = GetLastSpellCaster();

            if (GetPCTotalLevel(oPC) < 15)
            {
                Reward_2daXP(oPC, 12, FALSE); //600 xp reward if PC is less than 15th level
            }
            else
            {
                Reward_2daXP(oPC, 11, FALSE); //200 xp reward if PC is 15th level or higher
            }
            DelayCommand(1.0, AssignCommand(OBJECT_SELF, ActionStartConversation(GetLastSpellCaster())));
        }
    }
}

