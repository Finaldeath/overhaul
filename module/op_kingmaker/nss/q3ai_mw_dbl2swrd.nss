//::///////////////////////////////////////////////
//:: Sets the weapon type to two-bladed sword
//:: q3ai_mw_dbl2swrd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'two-bladed sword' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",53);
    //53=Two-Bladed Sword
}
