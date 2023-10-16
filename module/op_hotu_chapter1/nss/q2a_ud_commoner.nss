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
        object oEnemy = GetLastPerceived();
        if (GetIsReactionTypeHostile(oEnemy))
        {

            string szShout;
            switch(Random(3) + 1)
            {
                case 1: szShout= GetStringByStrRef(83993);
                        break;
                case 2: szShout= GetStringByStrRef(83994);
                        break;
                case 3: szShout= GetStringByStrRef(83995);
                        break;

            }
            ActionSpeakString(szShout, TALKVOLUME_TALK);
            ActionMoveAwayFromObject(oEnemy, TRUE, 35.0);

        }
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

    }
    else if(nUser == 1011) // ON SPELL CAST AT
    {
        if (GetLastSpell() == SPELL_CURE_CRITICAL_WOUNDS || GetLastSpell() == SPELL_CURE_LIGHT_WOUNDS || GetLastSpell() == SPELL_CURE_MINOR_WOUNDS || GetLastSpell() == SPELL_CURE_MODERATE_WOUNDS || GetLastSpell() == SPELL_CURE_SERIOUS_WOUNDS || GetLastSpell() == SPELL_HEAL || GetLastSpell() == SPELL_LESSER_RESTORATION || GetLastSpell() == SPELL_RESTORATION || GetLastSpell() == SPELL_GREATER_RESTORATION || GetLastSpell() == SPELL_RAISE_DEAD || GetLastSpell() == SPELL_RESURRECTION)
        {
            string szShout;
            switch(Random(3) + 1)
            {
                case 1: szShout= GetStringByStrRef(83996);
                        break;
                case 2: szShout= GetStringByStrRef(83997);
                        break;
                case 3: szShout= GetStringByStrRef(83998);
                        break;

            }
            ActionSpeakString(szShout, TALKVOLUME_TALK);
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

