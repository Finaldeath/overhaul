//::///////////////////////////////////////////////
//:: Name act_q1dkobold_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Daze the kobolds and change everyone
    to standard factions
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 11/03
//:://////////////////////////////////////////////

void main()
{
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
    effect eDaze = EffectDazed();
    effect eSleep = EffectSleep();
    effect ePerform = EffectVisualEffect(VFX_DUR_BARD_SONG);

    //Change all factions
    ChangeToStandardFaction(oShaman, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold3, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold4, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oCook, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oLodar, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob1, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob2, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob3, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob4, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob5, STANDARD_FACTION_COMMONER);
    ChangeToStandardFaction(oMob6, STANDARD_FACTION_COMMONER);
    //Put kobolds and cook to sleep for 6 rounds...
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDaze, oShaman, 6.0);
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDaze, oKobold1, 6.0));
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDaze, oKobold2, 6.0));
    DelayCommand(0.75, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDaze, oKobold3, 6.0));
    DelayCommand(0.75, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDaze, oKobold4, 6.0));
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDaze, oCook, 6.0));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePerform, GetPCSpeaker(), 6.0);

    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oShaman, 24.0));
    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oKobold1, 24.0));
    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oKobold2, 24.0));
    DelayCommand(2.75, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oKobold3, 24.0));
    DelayCommand(2.75, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oKobold4, 24.0));
    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oCook, 24.0));

    object oBarricade = GetObjectByTag("q1dbaricade_7");

    DelayCommand(2.0, AssignCommand(oMob1, ActionAttack(oBarricade)));
    DelayCommand(2.5, AssignCommand(oMob2, ActionAttack(oBarricade)));
    DelayCommand(3.0, AssignCommand(oMob3, ActionAttack(oBarricade)));
    DelayCommand(2.2, AssignCommand(oMob4, ActionAttack(oBarricade)));
    DelayCommand(2.7, AssignCommand(oMob5, ActionAttack(oBarricade)));
    DelayCommand(4.0, AssignCommand(oMob6, ActionAttack(oBarricade)));

    DelayCommand(12.0, AssignCommand(oMob1, ActionAttack(oKobold1)));
    DelayCommand(14.5, AssignCommand(oMob2, ActionAttack(oKobold2)));
    DelayCommand(15.0, AssignCommand(oMob3, ActionAttack(oKobold3)));
    DelayCommand(14.2, AssignCommand(oMob4, ActionAttack(oKobold4)));
    DelayCommand(14.7, AssignCommand(oMob5, ActionMoveToObject(oCook, TRUE)));
    DelayCommand(16.0, AssignCommand(oMob6, ActionMoveToObject(oCook, TRUE)));
    DelayCommand(4.0, ActionResumeConversation());

}
