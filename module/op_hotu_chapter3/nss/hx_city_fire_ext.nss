//::///////////////////////////////////////////////
//:: Name hx_city_fire_ext
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will set a variable and let the PC know
     they are near a fire.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();

    if(GetIsPC(oPC))
    {
        // They will take cold damage.
        SetLocalInt(oPC, "HX_PC_STANDING_NEAR", 0);
    }
}
