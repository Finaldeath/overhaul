//::///////////////////////////////////////////////
//:: Name act_q1dlodar_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    AFter surrender - the PC agrees to attack the
    Kobolds - all kobolds killed automatically
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 13/03
//:://////////////////////////////////////////////

void main()
{
    //the actors.
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
    effect eDamage = EffectDamage(50);

    //variables
    SetLocalInt(GetArea(OBJECT_SELF), "nKOBOLDSATTACKED", 1);
    SetLocalInt(GetPCSpeaker(), "Lodar_Job", 5);
    SetLocalInt(GetModule(), "Q1DKoboldSurrender", 3);
    SetLocalInt(GetModule(), "Captive_Cook", 3);

    //Change factions for attack
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

    //Mob attacks kobolds
    AssignCommand(oMob1, ActionAttack(oKobold2));
    AssignCommand(oMob2, ActionAttack(oKobold4));
    AssignCommand(oMob3, ActionAttack(oKobold3));
    AssignCommand(oMob4, ActionAttack(oKobold3));
    AssignCommand(oMob5, ActionAttack(oKobold1));
    AssignCommand(oMob6, ActionAttack(oKobold1));
    AssignCommand(oLodar, ActionAttack(oShaman));

    //Kobolds die
    DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oShaman));
    DelayCommand(4.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oKobold1));
    DelayCommand(4.7, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oKobold2));
    DelayCommand(4.7, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oKobold3));
    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oKobold4));

}
