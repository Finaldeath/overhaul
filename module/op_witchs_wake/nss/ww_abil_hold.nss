//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Cast Hold Person Check
//:: WW_Abil_Hold.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Does a Cast Hold Person check and broadcasts a
     feedback string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int bHasHold = GetHasSpell(SPELL_HOLD_PERSON, oPC);

    //If PC is unable to cast Hold, do nothing...
    if (bHasHold == FALSE)
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
        iClass1Level >= 5)
        iAbilityType = ABILITY_INTELLIGENCE;
    else if ((iClass1 == CLASS_TYPE_SORCERER &&
              iClass1Level >= 6) ||
             (iClass1 == CLASS_TYPE_BARD &&
              iClass1Level >= 4))
        iAbilityType = ABILITY_CHARISMA;
    else if (iClass1 == CLASS_TYPE_CLERIC &&
             iClass1Level >= 3)
        iAbilityType = ABILITY_WISDOM;
    //Class 2:
    else if (iClass2 == CLASS_TYPE_WIZARD &&
        iClass2Level >= 5)
        iAbilityType = ABILITY_INTELLIGENCE;
    else if ((iClass2 == CLASS_TYPE_SORCERER &&
              iClass2Level >= 6) ||
             (iClass2 == CLASS_TYPE_BARD &&
              iClass2Level >= 4))
        iAbilityType = ABILITY_CHARISMA;
    else if (iClass2 == CLASS_TYPE_CLERIC &&
             iClass2Level >= 3)
        iAbilityType = ABILITY_WISDOM;
    //Class 3:
   else if (iClass3 == CLASS_TYPE_WIZARD &&
        iClass3Level >= 5)
        iAbilityType = ABILITY_INTELLIGENCE;
    else if ((iClass3 == CLASS_TYPE_SORCERER &&
              iClass3Level >= 6) ||
             (iClass3 == CLASS_TYPE_BARD &&
              iClass3Level >= 4))
        iAbilityType = ABILITY_CHARISMA;
    else if (iClass3 == CLASS_TYPE_CLERIC &&
             iClass3Level >= 3)
        iAbilityType = ABILITY_WISDOM;
    //For Special Abilities, use Wisdom:
    else
        iAbilityType = ABILITY_WISDOM;

    //Decrement the spell & fake its casting
    AssignCommand(oPC, ActionPauseConversation());
    DecrementRemainingSpellUses(oPC, SPELL_HOLD_PERSON);
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_HOLD_PERSON, oNPC));
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
