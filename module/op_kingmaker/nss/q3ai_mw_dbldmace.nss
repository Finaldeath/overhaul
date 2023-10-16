//::///////////////////////////////////////////////
//:: Sets the weapon type to dire mace
//:: q3ai_mw_dbldmace
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'dire mace' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",51);
    //51=Dire Mace
}
