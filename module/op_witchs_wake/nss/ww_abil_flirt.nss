//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Flirt Check
//:: WW_Abil_Flirt.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Performs a Flirt Check and broadcasts a
    feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iPCGender = GetGender(oPC);
    int iNPCGender = GetGender(OBJECT_SELF);

    //If PC is the same gender as the NPC, do nothing...
    if (iPCGender == iNPCGender)
    {

    }

    //If the PC and the NPC are of different genders, proceed with the check.
    else
    {
        //Declare the values used in the Ability Check
        int iDC = GetLocalInt(OBJECT_SELF, "iWW_AbilityDC");
        int iD20 = Random(20)+1;
        int iChaMod = GetAbilityModifier(ABILITY_CHARISMA, oPC);

        //Create the final Check calculation.
        int iCheck = iD20 + (iChaMod * 4);

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
