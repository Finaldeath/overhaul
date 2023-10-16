//::///////////////////////////////////////////////
//:: Name hx_city_fire_ent
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
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC))
    {
        // They won't take cold damage.
        SetLocalInt(oPC, "HX_PC_STANDING_NEAR", 1);
        //SendMessageToPC(oPC, "[NOT IN STRING EDITOR] The warmth of the fire is very soothing in this bitter cold.");
        SendMessageToPCByStrRef(oPC, 85520);
        SetLocalInt(oPC, "HX_FIRETYPE", 2);
        SetLocalInt(oPC, "HX_FIRETYPE_SAFE", 0);
        SetLocalInt(oPC, "HX_FIRE_POTION", 0);
    }
}
