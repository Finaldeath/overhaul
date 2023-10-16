//::///////////////////////////////////////////////
//:: Name x2_pkeg_damaged
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If damaged by fire - powderkeg will ignite,
    else 20% chance of powderkeg blowing up
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: June 12/03
//:://////////////////////////////////////////////

void main()
{
    if (GetDamageDealtByType(DAMAGE_TYPE_FIRE) > 0)
    {
        ExecuteScript("x2_pkeg_ignite",OBJECT_SELF);
    } else
    if (d100()<21) // 20 % chance to blow it up
    {
        ExecuteScript("x2_pkeg_detonate",OBJECT_SELF);
    }

}
