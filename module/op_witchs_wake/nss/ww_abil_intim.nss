//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Intimidate Check
//:: WW_Abil_Intim.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Performs an Intimidate Skill Check and
    broadcasts a feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 20, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    //Declare the values used in the Ability Check
    int iDC = GetLocalInt(OBJECT_SELF, "iWW_AbilityDC");
    int iD20 = Random(20)+1;
    int iChaMod = GetAbilityModifier(ABILITY_CHARISMA, oPC);
    int iIntimidate = GetSkillRank(SKILL_INTIMIDATE, oPC);

    //Create the final Check calculation.
    int iCheck = iD20 + iChaMod + iIntimidate;

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
