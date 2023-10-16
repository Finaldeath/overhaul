//::///////////////////////////////////////////////
//:: Name: q2e_use_hidmac
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On use of the infernal machines in hell - they
    will randomly target another infernal machine
    and launch a spell at it - which will chain
    for 1 heartbeat
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 21/02
//:://////////////////////////////////////////////

//This function will choose and return one of the infernal machines
//to target (but not itself)
object ChooseTarget(object oShooter);

void main()
{
    object oTarget = ChooseTarget(OBJECT_SELF);

    AssignCommand( OBJECT_SELF, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget));// METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    object oTarget1 = ChooseTarget(oTarget);
    DelayCommand(1.0, AssignCommand( oTarget, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget1)));//, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
    object oTarget2 = ChooseTarget(oTarget1);
    DelayCommand(2.0, AssignCommand( oTarget1, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget2)));//, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
    object oTarget3 = ChooseTarget(oTarget2);
    DelayCommand(3.0, AssignCommand( oTarget2, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget3)));//, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
    object oTarget4 = ChooseTarget(oTarget3);
    DelayCommand(4.0, AssignCommand( oTarget3, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget4)));//, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
    object oTarget5 = ChooseTarget(oTarget4);
    DelayCommand(5.0, AssignCommand( oTarget4, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oTarget5)));//, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));

}

//return any of the five machine objects except the shooter
object ChooseTarget(object oShooter)
{

    int nRandom = Random(5) + 1;
    while (StringToInt(GetStringRight(GetTag(oShooter), 1)) == nRandom)
    {
        nRandom = Random(5) + 1;
    }

    return GetObjectByTag("q2e_machine" + IntToString(nRandom));
}
