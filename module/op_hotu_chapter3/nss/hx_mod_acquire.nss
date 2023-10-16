//::///////////////////////////////////////////////
//:: Name hx_mod_acquire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Anything that needs to be done on item acquir-
     ing.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 15, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetModuleItemAcquiredBy();
    object oItem = GetModuleItemAcquired();
    string sTag = GetTag(oItem);

    //Verify that it's being acquired by the PC
    if (GetIsPC(oPC) == TRUE)
    {
        //Sensei's Amulet
        if(sTag == "H2_SenseiAmulet")
        {
            //If they didn't get it by solving the Five-Fold Mysteries
            int bMysteriesComplete = GetLocalInt(GetModule(), "bMysteriesComplete");
            if (bMysteriesComplete == FALSE)
            {
                //Send them some floaty text to highlight that they have received it.
                FloatingTextStrRefOnCreature(110124, oPC);
            }
        }

        // Den of Fire prisoner ring.
        if(sTag == "hx_fireden_ring")
        {
            AddJournalQuestEntry("hx_prisoner", 30, oPC, TRUE, TRUE);
            //Give non-repeatable XP
            int i2daRow = 118;
            int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
            if (bDuplicate == FALSE)
            {
                SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                Reward_2daXP(oPC, i2daRow);
            }
        }
        // Demonic Grappling Hand.
        if(sTag == "dly_lore_grapple_hook")
        {
            AddJournalQuestEntry("hx_mimic_journ", 40, oPC, TRUE, TRUE);
            //Give non-repeatable XP
            int i2daRow = 115;
            int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
            if (bDuplicate == FALSE)
            {
                SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                Reward_2daXP(oPC, i2daRow);
            }
        }

        // Trumpet of Pandemonium
        if (sTag == "H2_Trumpet")
        {
            //Determine if they obtained it illegitimately.
            int bLegit = GetLocalInt(GetModule(), "bWonTrumpet");
            int bDoOnce = GetLocalInt(GetModule(), "bIllegitimateTrumpetDoOnce");
            if (bLegit == FALSE &&
                bDoOnce == FALSE)
            {
                //Flag the DoOnce
                SetLocalInt(GetModule(), "bIllegitimateTrumpetDoOnce", TRUE);

                object oArden = GetObjectByTag("H2_ArdenSwift");
                int bDead = GetIsDead(oArden);
                //If they pickpocketed it...
                if (bDead == FALSE)
                {
                    AddJournalQuestEntry("XP2_Arden", 60, oPC, TRUE, TRUE);
                    //Give non-repeatable XP
                    int i2daRow = 75;
                    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
                    if (bDuplicate == FALSE)
                    {
                        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                        Reward_2daXP(oPC, i2daRow);
                    }
                }
                //If they killed Arden for it...
                else
                {
                    AddJournalQuestEntry("XP2_Arden", 70, oPC, TRUE, TRUE);
                    //Give non-repeatable XP
                    int i2daRow = 76;
                    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
                    if (bDuplicate == FALSE)
                    {
                        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                        Reward_2daXP(oPC, i2daRow);
                    }
                }
            }
        }
    }
}
