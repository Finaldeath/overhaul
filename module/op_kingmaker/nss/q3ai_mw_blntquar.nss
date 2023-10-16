//::///////////////////////////////////////////////
//:: Sets the weapon type to quarterstaff
//:: q3ai_mw_blntquar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'quarterstaff' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",48);
    //48=Quarterstaff
}
