//::///////////////////////////////////////////////
//:: Name q2c_atk_slave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If one of the slaves is attacked,
    all slaves will 'transform' into their Rakshasa
    forms.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    object oArea = GetArea(OBJECT_SELF);
    ExecuteScript("act_q2rakattack", oArea);
}
