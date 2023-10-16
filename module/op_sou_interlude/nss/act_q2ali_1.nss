//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Cast Greater Bullstrength on PC.
     Set that PC has been given this gift once.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC,"ALIGIFT",1);
    ActionCastSpellAtObject(SPELL_GREATER_BULLS_STRENGTH,oPC,METAMAGIC_ANY,TRUE);
}
