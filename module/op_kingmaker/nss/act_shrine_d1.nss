//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take 10 gold, figure out which god pc follows,
     cast proper spell effect on pc
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetFirstPC();
    TakeGoldFromCreature(10,oPC,TRUE);
    //check if pc is follower of Pharos
    if (GetLocalInt(oPC,"os_pcbelieves")==10)
        ActionCastSpellAtObject(SPELL_GREATER_BULLS_STRENGTH,oPC,METAMAGIC_NONE,TRUE,20);

    //check if pc is follower of Mistress Death
    if (GetLocalInt(oPC,"os_pcbelieves")==20)
        ActionCastSpellAtObject(SPELL_DIVINE_SHIELD,oPC,METAMAGIC_NONE,TRUE,20);

    //check if pc is follower of Callahi
    if (GetLocalInt(oPC,"os_pcbelieves")==30)
        ActionCastSpellAtObject(SPELL_GREATER_CATS_GRACE,oPC,METAMAGIC_NONE,TRUE,20);

    //check if pc is follower of Veragok
    if (GetLocalInt(oPC,"os_pcbelieves")==40)
        ActionCastSpellAtObject(SPELL_IMPROVED_INVISIBILITY,oPC,METAMAGIC_NONE,TRUE,20);

    //check if pc is follower of Churl
    if (GetLocalInt(oPC,"os_pcbelieves")==50)
        ActionCastSpellAtObject(SPELL_DIVINE_POWER,oPC,METAMAGIC_NONE,TRUE,20);

    //check if pc is follower of Rictos
    if (GetLocalInt(oPC,"os_pcbelieves")==60)
        ActionCastSpellAtObject(SPELL_GREATER_SPELL_MANTLE,oPC,METAMAGIC_NONE,TRUE,20);

    //check if pc is follower of Suhili
    if (GetLocalInt(oPC,"os_pcbelieves")==70)
        ActionCastSpellAtObject(SPELL_GREATER_ENDURANCE,oPC,METAMAGIC_NONE,TRUE,20);

    //check if pc is follower of Jaess
    if (GetLocalInt(oPC,"os_pcbelieves")==80)
        ActionCastSpellAtObject(SPELL_GREATER_STONESKIN,oPC,METAMAGIC_NONE,TRUE,20);

    //check if pc is follower of Tamose
    if (GetLocalInt(oPC,"os_pcbelieves")==90)
        ActionCastSpellAtObject(SPELL_GREATER_EAGLE_SPLENDOR,oPC,METAMAGIC_NONE,TRUE,20);
}
