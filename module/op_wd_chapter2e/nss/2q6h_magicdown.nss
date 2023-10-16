//::///////////////////////////////////////////////
//:: Anti-Magic Down
//:: 2Q6H_MagicDown
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Brings down the anti-magic field holding
    Deltagar prisoner.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 1, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
void main()
{
    object oLight = GetNearestObjectByTag("2Q6H_Magic");
    if(GetIsObjectValid(oLight))
    {
       DestroyObject(oLight,0.0);
    }
}
