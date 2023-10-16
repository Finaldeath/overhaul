//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2e_ud_throncr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a creature belonging to a throne is killed, its "owner" loses 1000 XP
    regardless of whether or not he is still sitting on the throne (use a magical
    effect and display a string over the PC's head that says "Your creature in the
    ring has died, taking part of your essence with it.").
    When a creature belonging to a throne kills another creature, its "owner"
    gains a benefit… but only if he is still seated on the throne. The benefit
    is 2,000 XP and is accompanied by a magical effect.
    All the creatures that are spawned in, though they might use different models,
    should use the same statistics and have the same hit points.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Jan 15 / 03
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
        //only do this action once...
        if (GetLocalInt(OBJECT_SELF, "nDoneOnce") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nDoneOnce", 1);
            //If I was killed by a creature from one of the other thrones...
            //If that creatures controller is sitting on that same throne,
            //he gets 2000 xp.
            object oKiller = GetLastKiller();
            //find out if the killing creature's owner is sitting on the killing creatures throne
            if(GetName(GetSittingCreature(GetObjectByTag("q2eThrone" + GetStringLeft(GetTag(oKiller),1)))) == GetLocalString(oKiller, "szOwner"))
            {
                object oPC = GetSittingCreature(GetObjectByTag("q2eThrone" + GetStringLeft(GetTag(oKiller),1)));
                if (GetPCTotalLevel(oPC) < 15)
                {
                    Reward_2daXP(GetSittingCreature(GetObjectByTag("q2eThrone" + GetStringLeft(GetTag(oKiller),1))), XP_EPIC, FALSE);
                }
                else
                {
                    Reward_2daXP(GetSittingCreature(GetObjectByTag("q2eThrone" + GetStringLeft(GetTag(oKiller),1))), XP_VERY_HIGH, FALSE);

                }
            }

            //The creature's owner of the dead creature loses 1000 xp
            object oTarget;
            object oPC = GetFirstPC();
            while (oPC != OBJECT_INVALID)
            {
                if (GetName(oPC) == GetLocalString(OBJECT_SELF, "szOwner"))
                    oTarget = oPC;
                oPC = GetNextPC();
            }
            int nXP = GetXP(oTarget);
            int nPenalty = 1000;
            int nHD = GetHitDice(oTarget);
            // * You can not lose a level with this penalty
            int nMin = ((nHD * (nHD - 1)) / 2) * 1000;

            int nNewXP = nXP - nPenalty;
            if (nNewXP < nMin)
                nNewXP = nMin;
            SetXP(oTarget, nNewXP);
            FloatingTextStrRefOnCreature(84138 , oTarget);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

