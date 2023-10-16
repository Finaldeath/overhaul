//:://////////////////////////////////////////////////
//:: Q2B_HEN_USRDEF
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
    Henchman will check to see if someone has cast
      Raise Dead, Ressurection on her.
      If so - reward XP and give journal entry.

--> August 2003: Script now redundant
    This functionality moved into global
    henchmen scripts

 */
//:://////////////////////////////////////////////////
//:://////////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: July 15/03/02
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "x2_inc_plot"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "X2_KilledInUndermountain") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "X2_KilledInUndermountain", 1);

        //Level up henchman to level 13
        int nLevel = 1;
        for (nLevel = 1; nLevel < 14; nLevel++)
        {
            LevelUpHenchman(OBJECT_SELF);
        }
        //'kill the henchman'
        effect eDamage = EffectDamage(500);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, OBJECT_SELF);
    }
    else if(nUser == 1011) // On Spell Cast At
    {
        //This should only fire the first time they are raised - when they have
        //first been discovered in Undermountain
        if (GetLocalInt(OBJECT_SELF, "X2_SavedInUndermountain") == 1)
            return;

        if (GetLastSpell() == SPELL_RAISE_DEAD || GetLastSpell() == SPELL_RESURRECTION)
        {
            SetLocalInt(OBJECT_SELF, "X2_SavedInUndermountain", 1);

            object oPC = GetLastSpellCaster();

            if (GetTag(OBJECT_SELF) == "x2_hen_sharwyn")
            {
                AddJournalQuestEntry("q2sharwyn", 20, oPC);
            }
            else if (GetTag(OBJECT_SELF) == "x2_hen_tomi")
            {
                AddJournalQuestEntry("q2tomi", 20, oPC);
            }
            else if (GetTag(OBJECT_SELF) == "x2_hen_daelan")
            {
                AddJournalQuestEntry("q2daelan", 20, oPC);
            }

            if (GetPCTotalLevel(oPC) < 15)
            {
                Reward_2daXP(oPC, 12, TRUE); //600 xp reward if PC is less than 15th level
            }
            else
            {
                Reward_2daXP(oPC, 11, TRUE); //200 xp reward if PC is 15th level or higher

            }
            //DelayCommand(1.5, ActionStartConversation(oPC));
        }
    }

}

