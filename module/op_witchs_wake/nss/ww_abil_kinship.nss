//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Kinship Check
//:: WW_Abil_Kinship.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Performs a Kinship Check and broadcasts a
    feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iPCRace = GetRacialType(oPC);
    int iNPCRace = GetRacialType(OBJECT_SELF);

    //If PC and NPC are of different races, do nothing.
    if (iPCRace != iNPCRace)
    {

    }

    //If the PC and the NPC are of the same race, proceed with the check.
    else
    {
        //Declare the values used in the Ability Check
        int iDC = GetLocalInt(OBJECT_SELF, "iWW_AbilityDC");
        int iD20 = Random(20)+1;
        int iChaMod = GetAbilityModifier(ABILITY_CHARISMA, oPC);
        int iPersuade = GetSkillRank(SKILL_PERSUADE, oPC);
        int iKinBonus = 5;

        //Create the final Check calculation.
        int iCheck = iD20 + iPersuade + iChaMod + iKinBonus;

        //Convert the above Ints to Strings in preparation for broadcast.
        string sDC = IntToString(iDC);
        string sCheck = IntToString(iCheck);
        string sBroadcast = "You roll: "+sCheck+" vs. DC "+sDC;

        //If the PC's Check >= DC, they succeed.
        if (iCheck >= iDC)
        {
            SetLocalString(OBJECT_SELF, "sWW_AbilityResult", "Success");
        }
        //If not, they fail.
        else
        {
            SetLocalString(OBJECT_SELF, "sWW_AbilityResult", "Failure");
        }
        SendMessageToPC(oPC, sBroadcast);
    }
}
