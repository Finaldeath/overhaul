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
        if ((GetLocalInt(GetModule(), "X2_ypattack") == 2 ||GetLocalInt(GetModule(), "X2_ypattack") == 3) && IsInConversation(OBJECT_SELF) == FALSE)
        {
            ActionMoveToObject(GetWaypointByTag("wp_q2agrayban"));
            DelayCommand(10.0, SetFacingPoint(GetPosition(GetWaypointByTag("q2a_mapnote1"))));
        }

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        if (Random(4) == 1)
        {
            switch (Random(3) + 1)
            {
                case 1: SpeakStringByStrRef(84026);
                        break;
                case 2: SpeakStringByStrRef(84027);
                        break;
                case 3: SpeakStringByStrRef(84028);
                        break;
            }
        }
    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {//Hurt and Dead variables for q2a_ud_white
        SetLocalInt(GetModule(), "X2_q2a_graybanH", 1);
    }
    else if(nUser == 1007) // DEATH
    {
        SetLocalInt(GetModule(), "X2_q2a_graybanD", 1);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 1011) // On Spell Cast At
    {
        if (GetLastSpell() == SPELL_CURE_CRITICAL_WOUNDS || GetLastSpell() == SPELL_CURE_LIGHT_WOUNDS || GetLastSpell() == SPELL_CURE_MINOR_WOUNDS || GetLastSpell() == SPELL_CURE_MODERATE_WOUNDS || GetLastSpell() == SPELL_CURE_SERIOUS_WOUNDS || GetLastSpell() == SPELL_HEAL || GetLastSpell() == SPELL_LESSER_RESTORATION || GetLastSpell() == SPELL_RESTORATION || GetLastSpell() == SPELL_GREATER_RESTORATION || GetLastSpell() == SPELL_RAISE_DEAD || GetLastSpell() == SPELL_RESURRECTION)
        {
            SpeakStringByStrRef(84029);
            //Reward PC for raising NPC
            if ((GetLastSpell() == SPELL_RAISE_DEAD || GetLastSpell() == SPELL_RESURRECTION) && GetIsPC(GetLastSpellCaster()) == TRUE && GetLocalInt(OBJECT_SELF, "nRaised") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nRaised", 1);
                object oPC = GetLastSpellCaster();

                if (GetPCTotalLevel(oPC) < 15)
                {
                    Reward_2daXP(oPC, 12, FALSE); //600 xp reward if PC is less than 15th level
                }
                else
                {
                    Reward_2daXP(oPC, 11, FALSE); //200 xp reward if PC is 15th level or higher

                }
                AdjustAlignment(GetLastSpellCaster(), ALIGNMENT_GOOD, 3);
            }
        }
    }
}

