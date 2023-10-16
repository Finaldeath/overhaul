//::///////////////////////////////////////////////
//:: Name x2_pkeg_damaged
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If damaged but not more than 50% damage done - powderkeg will ignite,
    else powderkeg blows up
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: June 12/03
//:://////////////////////////////////////////////

void main()
{
    if (GetCurrentHitPoints() >= GetMaxHitPoints() / 2)
    {
        ExecuteScript("x2_pkeg_ignite",OBJECT_SELF);
    }
    else
    // blow it up
    {
        ExecuteScript("x2_pkeg_detonate",OBJECT_SELF);
    }

}
