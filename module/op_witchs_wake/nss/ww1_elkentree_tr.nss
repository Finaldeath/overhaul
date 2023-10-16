//::///////////////////////////////////////////////
//:: Witchwork 1: Elkentree Trigger
//:: WW1_Elkentree_Tr.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launches the Elkentree conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 13, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE &&
        GetIsPossessedFamiliar(oPC) == FALSE)
    {
        int bSecret = GetLocalInt(oPC, "CONV_ANGMAR_Secret");
        object oElkentree = GetNearestObjectByTag("Elkentree");

        //Do a Search Check...
        //DC varies depending on whether or not you know of Angmar's Secret.
        int iDC = 15;
        if (bSecret == TRUE)
        {
            iDC = 7;
        }
        //d20 is halved if in passive mode
        int iD20 = Random(20)+1;
        if (GetDetectMode(oPC) == DETECT_MODE_PASSIVE)
        {
            iD20 = Random(10)+1;
        }
        //Elves, Dwarves, and Half-Elves recieve bonuses.
        int iRace = GetRacialType(oPC);
        int iRaceBonus = 0;
        if (iRace == RACIAL_TYPE_DWARF ||
            iRace == RACIAL_TYPE_ELF)
        {
            iRaceBonus = 2;
        }
        else if (iRace == RACIAL_TYPE_HALFELF)
        {
            iRaceBonus = 1;
        }
        //Define remaining values used in the check
        int iIntMod = GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
        int iSearch = GetSkillRank(SKILL_SEARCH, oPC);

        //Create the final Check calculation.
        int iCheck = iD20 + iIntMod + iSearch + iRaceBonus;

        //If the PC's Check >= DC, they succeed.
        if (iCheck >= iDC)
        {
            //Send Check feedback.
            string sDC = IntToString(iDC);
            string sCheck = IntToString(iCheck);
            string sBroadcast = "Search Check: You roll: "+sCheck+" vs. DC "+sDC;
            SendMessageToPC(oPC, sBroadcast);

            AssignCommand(oElkentree, ActionStartConversation(oPC));
        }
    }
}
