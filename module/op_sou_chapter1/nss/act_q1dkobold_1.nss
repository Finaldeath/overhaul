//::///////////////////////////////////////////////
//:: Name act_q1dkobold_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The kobolds will destroy the barricade and
    walk/run to the exit and leave...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 7/03
//:://////////////////////////////////////////////

void main()
{

    //Variable for conversations
    SetLocalInt(GetPCSpeaker(), "Lodar_Job", 2);
    //Variable for the cooks heartbeat
    SetLocalInt(GetModule(), "X1_COOKHOSTAGE", 1);

    //The Players
    object oPC = GetPCSpeaker();
    object oShaman = GetObjectByTag("q1dk_shaman");
    object oKobold1 = GetObjectByTag("q1dk_footpad1");
    object oKobold2 = GetObjectByTag("q1dk_footpad2");
    object oKobold3 = GetObjectByTag("q1dk_footpad3");
    object oKobold4 = GetObjectByTag("q1dk_footpad4");
    object oCook = GetObjectByTag("q1dcook");

    object oSpellTarget = GetObjectByTag("q1d_spelltarget");
    object oBarricade = GetObjectByTag("q1dbaricade_7");
    //Tell barricade that its ok for it to be destroyed...
    if (oBarricade != OBJECT_INVALID)
    {
        SetLocalInt(GetArea(oPC), "nKoboldDestroyed", 1);
        effect eDamage = EffectDamage(500);
        DelayCommand(2.0, AssignCommand(oShaman, ActionCastFakeSpellAtObject(SPELL_MAGIC_MISSILE,oSpellTarget)));
        DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarricade));
    }

    object oExit = GetWaypointByTag("wp_q1d_exit");

    AssignCommand(oShaman, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 1.0, 2.0));
    //**HACK - He needs a 12.0 second delay here for some reason - DO NOT CHANGE HACK**
    DelayCommand(12.0, AssignCommand(oShaman, ActionMoveToObject(oExit, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold1, ActionMoveToObject(oExit, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold2, ActionMoveToObject(oExit, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold3, ActionMoveToObject(oExit, TRUE)));
    DelayCommand(6.0, AssignCommand(oKobold4, ActionMoveToObject(oExit, TRUE)));
    DelayCommand(6.0, AssignCommand(oCook, ActionMoveToObject(oExit, TRUE)));

    DelayCommand(7.0, SetCommandable(FALSE, oCook));
    DelayCommand(7.0, SetCommandable(FALSE, oKobold1));
    DelayCommand(7.0, SetCommandable(FALSE, oKobold2));
    DelayCommand(7.0, SetCommandable(FALSE, oKobold3));
    DelayCommand(7.0, SetCommandable(FALSE, oKobold4));
    DelayCommand(13.0, SetCommandable(FALSE, oShaman));
}
