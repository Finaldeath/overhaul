//::///////////////////////////////////////////////
//:: Witch Wake 1: Include (Paladin Falls)
//:: WW1_Inc_Paladin.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Include file that handles falling paladins.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 1, 2002
//:://////////////////////////////////////////////

void PaladinFalls(object oPC)
{
    //Return if oPC is not a PC or otherwise invalid.
    if (!GetIsPC(oPC) || !GetIsObjectValid(oPC)) return;

    int iPaladin = GetLevelByClass(CLASS_TYPE_PALADIN, oPC);

    //Only worry about paladins.
    if (iPaladin > 0)
    {
        //Witch's Wake: If the paladin has already fallen, return without
        //modifying their alignment further.
        int iPaladin = GetLevelByClass(CLASS_TYPE_PALADIN);
        int iGoodEvil = GetAlignmentGoodEvil(oPC);
        int iLawChaos = GetAlignmentLawChaos(oPC);
        if (iPaladin > 0 &&
           (iGoodEvil != ALIGNMENT_GOOD ||
            iLawChaos != ALIGNMENT_LAWFUL))
        {
            return;
        }

        //Determine whether or not they've been warned before.
        int iWarning = GetLocalInt(oPC, "WW_PaladinWarning");

        //If they haven't been warned, send them a warning.
        if (iWarning == FALSE)
        {
            string sWarning = "WARNING! The action you just performed is one "+
                              "unbefitting of a Paladin. Take great care in "+
                              "the future -- your deity will not accept any "+
                              "further such indescretions.";
            FloatingTextStringOnCreature("WARNING!", oPC, FALSE);
            SendMessageToPC(oPC, sWarning);
            SetLocalInt(oPC, "WW_PaladinWarning", TRUE);
        }
        //If they have been warned, make them fall.
        else
        {
            //Adjust their alignment, converting them to TRUE NEUTRAL.
            AdjustAlignment(oPC, ALIGNMENT_NEUTRAL, 100);
        }
    }
}
