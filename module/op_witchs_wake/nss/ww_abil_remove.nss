//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Cast Remove Fear Check
//:: WW_Abil_Remove.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Does a Cast Remove Fear check and broadcasts a
     feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int bHasRemoveFear = GetHasSpell(SPELL_REMOVE_FEAR, oPC);

    //If PC is unable to cast Remove Fear, do nothing...
    if (bHasRemoveFear == FALSE)
    {
        return;
    }

    object oNPC = OBJECT_SELF;
    int iAbilityType;
    int iSpell;

    //Get the PC's individual class levels for calculating their total
    //character level.
    int iClass1Level = GetLevelByPosition(1, oPC);
    int iClass2Level = GetLevelByPosition(2, oPC);
    int iClass3Level = GetLevelByPosition(3, oPC);

    //Decrement the spell & fake its casting
    AssignCommand(oPC, ActionPauseConversation());
    DecrementRemainingSpellUses(oPC, SPELL_REMOVE_FEAR);
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_REMOVE_FEAR, oNPC));
    AssignCommand(oPC, ActionResumeConversation());

    //Declare the values used in the Ability Check
    int iDC = GetLocalInt(OBJECT_SELF, "iWW_AbilityDC");
    int iD20 = Random(20)+1;
    int iAbilMod = GetAbilityModifier(ABILITY_WISDOM, oPC);
    int iCharLevel = iClass1Level + iClass2Level + iClass3Level;

    //Create the final Check calculation.
    int iCheck = iD20 + iAbilMod + iCharLevel;

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
