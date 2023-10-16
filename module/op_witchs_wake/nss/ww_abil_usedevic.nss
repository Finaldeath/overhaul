//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Use Magic Device Check
//:: WW_Abil_UseDevic.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Performs a Use Magic Device Check and broadcasts a
    feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int bHasUseMagicDevice = GetHasSkill(SKILL_USE_MAGIC_DEVICE, oPC);

    //If PC is doesn't have Use Magic Device, do nothing...
    if (bHasUseMagicDevice == FALSE)
    {
        return;
    }

    //Declare the values used in the Ability Check
    int iDC = GetLocalInt(OBJECT_SELF, "iWW_AbilityDC");
    int iD20 = Random(20)+1;
    int iChaMod = GetAbilityModifier(ABILITY_CHARISMA, oPC);
    int iUseMagicDevice = GetSkillRank(SKILL_USE_MAGIC_DEVICE, oPC);

    //Create the final Check calculation.
    int iCheck = iD20 + iChaMod + iUseMagicDevice;

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
