//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Cast Confusion Check
//:: WW_Abil_Confuse.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Does a Cast Confusion check and broadcasts a
     feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int bHasConfuse = GetHasSpell(SPELL_CONFUSION, oPC);

    //If PC is unable to cast Confuse, do nothing...
    if (bHasConfuse == FALSE)
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

    //Determine what those three classes are.
    int iClass1 = GetClassByPosition(1, oPC);
    int iClass2 = GetClassByPosition(2, oPC);
    int iClass3 = GetClassByPosition(3, oPC);

    //Make an educated guess as to what class they might be casting from so you
    //can use the appropriate ability score modifier.
    //Class 1:
    if (iClass1 == CLASS_TYPE_WIZARD &&
        iClass1Level >= 7)
        iAbilityType = ABILITY_INTELLIGENCE;
    else if ((iClass1 == CLASS_TYPE_SORCERER &&
              iClass1Level >= 8) ||
             (iClass1 == CLASS_TYPE_BARD &&
              iClass1Level >= 7))
        iAbilityType = ABILITY_CHARISMA;
    //Class 2:
    else if (iClass2 == CLASS_TYPE_WIZARD &&
             iClass2Level >= 7)
        iAbilityType = ABILITY_INTELLIGENCE;
    else if ((iClass2 == CLASS_TYPE_SORCERER &&
              iClass2Level >= 8) ||
             (iClass2 == CLASS_TYPE_BARD &&
              iClass2Level >= 7))
        iAbilityType = ABILITY_CHARISMA;
    //Class 3:
    else if (iClass3 == CLASS_TYPE_WIZARD &&
             iClass3Level >= 7)
        iAbilityType = ABILITY_INTELLIGENCE;
    else if ((iClass3 == CLASS_TYPE_SORCERER &&
              iClass3Level >= 8) ||
             (iClass3 == CLASS_TYPE_BARD &&
              iClass3Level >= 7))
        iAbilityType = ABILITY_CHARISMA;
    //For Special Abilities, use intelligence:
    else
        iAbilityType = ABILITY_INTELLIGENCE;

    //Decrement the spell & cast a fake one
    AssignCommand(oPC, ActionPauseConversation());
    DecrementRemainingSpellUses(oPC, SPELL_CONFUSION);
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_CONFUSION, oNPC));
    AssignCommand(oPC, ActionResumeConversation());

    //Declare the values used in the Ability Check
    int iDC = GetLocalInt(OBJECT_SELF, "iWW_AbilityDC");
    int iD20 = Random(20)+1;
    int iAbilMod = GetAbilityModifier(iAbilityType, oPC);
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
