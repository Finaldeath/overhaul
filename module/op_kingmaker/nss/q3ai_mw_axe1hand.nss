//::///////////////////////////////////////////////
//:: Sets the weapon type to One Handed
//:: q3ai_mw_axe1hand
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'one handed axe' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",12);
    //12=One Handed Axe
}
