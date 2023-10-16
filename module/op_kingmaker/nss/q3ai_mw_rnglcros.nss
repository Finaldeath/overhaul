//::///////////////////////////////////////////////
//:: Sets the weapon type to light crossbow
//:: q3ai_mw_rnglcros
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'light crossbow' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",82);
    //82=Light crossbow
}
