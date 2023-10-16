//::///////////////////////////////////////////////
//:: Name act_q1dkobold_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put the kobolds to sleep and change everyone
    to standard factions
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 11/03
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();

    object oShaman = GetObjectByTag("q1dk_shaman");
    object oKobold1 = GetObjectByTag("q1dk_footpad1");
    object oKobold2 = GetObjectByTag("q1dk_footpad2");
    object oKobold3 = GetObjectByTag("q1dk_footpad3");
    object oKobold4 = GetObjectByTag("q1dk_footpad4");
    object oCook = GetObjectByTag("q1dcook");
    object oLodar = GetObjectByTag("q1dlodar");
    object oMob1 = GetObjectByTag("q1dmob1");
    object oMob2 = GetObjectByTag("q1dmob2");
    object oMob3 = GetObjectByTag("q1dmob3");
    object oMob4 = GetObjectByTag("q1dmob4");
    object oMob5 = GetObjectByTag("q1dmob5");
    object oMob6 = GetObjectByTag("q1dmob6");
    effect eSleep = EffectSleep();

    //Spell Animation
    AssignCommand(GetPCSpeaker(), ActionCastFakeSpellAtObject(SPELL_SLEEP, oShaman));
    DecrementRemainingSpellUses(GetPCSpeaker(), SPELL_SLEEP);

    //Change all factions
    DelayCommand(3.0, ChangeToStandardFaction(oShaman, STANDARD_FACTION_HOSTILE));
    DelayCommand(3.0, ChangeToStandardFaction(oKobold1, STANDARD_FACTION_HOSTILE));
    DelayCommand(3.0, ChangeToStandardFaction(oKobold2, STANDARD_FACTION_HOSTILE));
    DelayCommand(3.0, ChangeToStandardFaction(oKobold3, STANDARD_FACTION_HOSTILE));
    DelayCommand(3.0, ChangeToStandardFaction(oKobold4, STANDARD_FACTION_HOSTILE));
    DelayCommand(3.0, ChangeToStandardFaction(oCook, STANDARD_FACTION_COMMONER));
    DelayCommand(3.0, ChangeToStandardFaction(oLodar, STANDARD_FACTION_COMMONER));
    DelayCommand(3.0, ChangeToStandardFaction(oMob1, STANDARD_FACTION_COMMONER));
    DelayCommand(3.0, ChangeToStandardFaction(oMob2, STANDARD_FACTION_COMMONER));
    DelayCommand(3.0, ChangeToStandardFaction(oMob3, STANDARD_FACTION_COMMONER));
    DelayCommand(3.0, ChangeToStandardFaction(oMob4, STANDARD_FACTION_COMMONER));
    DelayCommand(3.0, ChangeToStandardFaction(oMob5, STANDARD_FACTION_COMMONER));
    DelayCommand(3.0, ChangeToStandardFaction(oMob6, STANDARD_FACTION_COMMONER));
    //Put kobolds and cook to sleep for 4 rounds...
    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oShaman, 24.0));
    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oKobold1, 24.0));
    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oKobold2, 24.0));
    DelayCommand(2.75, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oKobold3, 24.0));
    DelayCommand(2.75, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oKobold4, 24.0));
    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oCook, 24.0));

    object oBarricade = GetObjectByTag("q1dbaricade_7");

    DelayCommand(4.0, AssignCommand(oMob1, ActionAttack(oBarricade)));
    DelayCommand(4.5, AssignCommand(oMob2, ActionAttack(oBarricade)));
    DelayCommand(5.0, AssignCommand(oMob3, ActionAttack(oBarricade)));
    DelayCommand(4.2, AssignCommand(oMob4, ActionAttack(oBarricade)));
    DelayCommand(4.7, AssignCommand(oMob5, ActionAttack(oBarricade)));
    DelayCommand(6.0, AssignCommand(oMob6, ActionAttack(oBarricade)));

    DelayCommand(12.0, AssignCommand(oMob1, ActionAttack(oKobold1)));
    DelayCommand(14.5, AssignCommand(oMob2, ActionAttack(oKobold2)));
    DelayCommand(15.0, AssignCommand(oMob3, ActionAttack(oKobold3)));
    DelayCommand(14.2, AssignCommand(oMob4, ActionAttack(oKobold4)));
    DelayCommand(14.7, AssignCommand(oMob5, ActionMoveToObject(oCook, TRUE)));
    DelayCommand(16.0, AssignCommand(oMob6, ActionMoveToObject(oCook, TRUE)));
    DelayCommand(4.0, ActionResumeConversation());
}
