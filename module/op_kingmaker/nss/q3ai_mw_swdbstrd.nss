//::///////////////////////////////////////////////
//:: Sets the weapon type to Bastard Sword
//:: q3ai_mw_swdbstrd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'bastard sword' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",21);
    //21=Bastard Sword
}
