//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Stunning Fist Check
//:: WW_Abil_Stun.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Performs a Stunning Fist Check and broadcasts
    a feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int bHasStun = GetHasFeat(FEAT_STUNNING_FIST, oPC);

    //If PC is unable to use Stunning Fist, do nothing...
    if (bHasStun == FALSE)
    {

    }

    //If the PC can use Stunning Fist, do so and proceed with the check.
    else
    {
        //Decrement the PC's Stunning Fist feat.
        DecrementRemainingFeatUses(oPC, FEAT_STUNNING_FIST);

        //Get the PC's individual class levels for calculating their total
        //character level.
        int iClass1Level = GetLevelByPosition(1, oPC);
        int iClass2Level = GetLevelByPosition(2, oPC);
        int iClass3Level = GetLevelByPosition(3, oPC);

        //Declare the values used in the Ability Check
        int iDC = GetLocalInt(OBJECT_SELF, "iWW_AbilityDC");
        int iD20 = Random(20)+1;
        int iWisMod = GetAbilityModifier(ABILITY_WISDOM, oPC);
        int iCharLevel = iClass1Level + iClass2Level + iClass3Level;

        //Apply a penalty if they're not a Monk.
        int iClassPenalty = 0;
        int iMonk = GetLevelByClass(CLASS_TYPE_MONK, oPC);

        if(iMonk == 0)
        {
            iClassPenalty = -4;
        }

        //Create the final Check calculation.
        int iCheck = iD20 + iWisMod + iCharLevel + iClassPenalty;

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
