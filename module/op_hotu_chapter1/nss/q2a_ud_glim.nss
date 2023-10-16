//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2a_ud_glim
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Glim's User Defined Events
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
        if ((GetLocalInt(GetModule(), "X2_ypattack") == 2 || GetLocalInt(GetModule(), "X2_ypattack") == 3) && IsInConversation(OBJECT_SELF) == FALSE)
        {
            if (GetLocalInt(OBJECT_SELF, "nUnEquipped") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nUnEquipped", 1);
                object oRHand = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
                object oLHand = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);
                if (GetIsObjectValid(oRHand) == TRUE)
                    ActionUnequipItem(oRHand);
                if (GetIsObjectValid(oLHand) == TRUE)
                    ActionUnequipItem(oLHand);
            }
            ActionMoveToObject(GetWaypointByTag("wp_q2aglim"));
            DelayCommand(10.0, SetFacingPoint(GetPosition(GetWaypointByTag("q2afacer2"))));
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
                case 1: SpeakStringByStrRef(84020);
                        break;
                case 2: SpeakStringByStrRef(84021);
                        break;
                case 3: SpeakStringByStrRef(84022);
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
    {   //Hurt and Res variables for q2a_ud_white
         SetLocalInt(GetModule(), "X2_cut1_glimH", 1);
    }
    else if(nUser == 1007) // DEATH
    {
        SetLocalInt(GetModule(), "X2_cut1_glimD", 1);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 1011) // On Spell Cast At
    {
        if (GetLastSpell() == SPELL_CURE_CRITICAL_WOUNDS || GetLastSpell() == SPELL_CURE_LIGHT_WOUNDS || GetLastSpell() == SPELL_CURE_MINOR_WOUNDS || GetLastSpell() == SPELL_CURE_MODERATE_WOUNDS || GetLastSpell() == SPELL_CURE_SERIOUS_WOUNDS || GetLastSpell() == SPELL_HEAL || GetLastSpell() == SPELL_LESSER_RESTORATION || GetLastSpell() == SPELL_RESTORATION || GetLastSpell() == SPELL_GREATER_RESTORATION || GetLastSpell() == SPELL_RAISE_DEAD || GetLastSpell() == SPELL_RESURRECTION)
        {
            switch (Random(3) + 1)
            {
                case 1: SpeakStringByStrRef(84023);
                        break;
                case 2: SpeakStringByStrRef(84024);
                        break;
                case 3: SpeakStringByStrRef(84025);
                        break;
            }
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

